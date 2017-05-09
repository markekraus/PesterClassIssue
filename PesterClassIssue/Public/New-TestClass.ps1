Using module '..\Classes\TestClass.psm1'
function New-TestClass {
    [CmdletBinding()]
    param (
        [string]$Property = 'FunctionGenerated'
    )
    
    process {
        [TestClass]::New($Property)
    }
}