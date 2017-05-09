Using module '..\Enums\TestEnum.psm1'

Class TestClass {
    static [string] $Satic = 'Static'
    [string]$Property = 'Default'
    [TestEnum]$Enum = [TestEnum]::Value1
    static [string] StaticMethod () {
        return 'Static Vlaue'
    }
    TestClass () {}
    TestClass ([string]$Property) {
        $This.Property = $Property
    }
}