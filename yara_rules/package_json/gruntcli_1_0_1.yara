rule gruntcli
{
    meta:
        name = "gruntcli@1.0.1"

    strings:
        $name = /"name":\s"gruntcli",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}