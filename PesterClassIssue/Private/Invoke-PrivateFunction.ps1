function Invoke-PrivateFunction {
    [CmdletBinding()]
    param (
        [TestClass]$TestClass,
        [string]$SomeString = [TestClass]::Static
    )
    
    process {
        [PscustomObject]@{
            TestClass = $TestClass
            SomeString = $SomeString
            TestClassSaticMehtod = [TestClass]::StaticMethod()
        }
    }
}