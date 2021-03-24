rule babelcli
{
    meta:
        name = "babelcli@1.0.1"

    strings:
        $name = /"name":\s"babelcli",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}