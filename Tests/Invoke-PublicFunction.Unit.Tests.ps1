$projectRoot = Resolve-Path "$PSScriptRoot\.."
$moduleRoot = Split-Path (Resolve-Path "$projectRoot\*\*.psd1")
$moduleName = Split-Path $moduleRoot -Leaf
Remove-Module -Force $moduleName  -ErrorAction SilentlyContinue
Import-Module (Join-Path $moduleRoot "$moduleName.psd1") -force -Verbose


$TestClass = New-TestClass -Property 'TestyTest'

Write-Host $TestClass.Property
Write-Host $TestClass.Enum

describe 'Can Crearte [TestClass]' {
    it 'Creates a test class' {
        [TestClass]::new('TestyTest')
    }
    it 'Can be used in the function' {
        {Invoke-PublicFunction -TestClass ([TestClass]::new('TestyTest'))} | should Not Throw
    }
    mock -ModuleName PesterClassIssue -CommandName Invoke-PrivateFunction -MockWith {
        [pscustomobject]@{
            Property = 'Mocked Property'
        }
    }
    it 'Works with a mocked Private function' {
        {Invoke-PublicFunction -TestClass ([TestClass]::new('TestyTest'))} | should Not Throw
    }
}

describe 'Invoke-PublicFunction' {
    it 'Runs without error' {
        {Invoke-PublicFunction -TestClass $TestClass} | should Not Throw
    }
}

describe 'Invoke-PublicFunction with private mocking' {
    mock -ModuleName PesterClassIssue -CommandName Invoke-PrivateFunction -MockWith {
        [pscustomobject]@{
            Property = 'Mocked Property'
        }
    }
    it 'Runs without error' {
        {Invoke-PublicFunction -TestClass $TestClass} | should Not Throw
    }
}

