function New-TestClass {
    [CmdletBinding()]
    param (
        [string]$Property = 'FunctionGenerated'
    )
    
    process {
        [TestClass]::New($Property)
    }
}