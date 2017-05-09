Using module '..\Classes\TestClass.psm1'

function Invoke-PublicFunction {
    [CmdletBinding()]
    param (
        [TestClass]$TestClass,
        [string]$SomeString = [TestClass]::Static
    )
    
    process {
        $Result = Invoke-PrivateFunction -TestClass $TestClass -SomeString $SomeString
        [PscustomObject]@{
            TestClass = $TestClass
            SomeString = $SomeString
            TestClassSaticMehtod = [TestClass]::StaticMethod()
            PrivateResult = $Result
        }
    }
}