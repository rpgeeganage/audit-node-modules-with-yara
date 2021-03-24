rule sqliter
{
    meta:
        name = "sqliter@2.8.1"

    strings:
        $name = /"name":\s"sqliter",/
        $version = /"version":\s"2.8.1"/

    condition:
        all of them
}