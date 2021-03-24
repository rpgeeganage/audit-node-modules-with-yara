rule crossenv
{
    meta:
        name = "crossenv@6.1.1"

    strings:
        $name = /"name":\s"crossenv",/
        $version = /"version":\s"6.1.1"/

    condition:
        all of them
}