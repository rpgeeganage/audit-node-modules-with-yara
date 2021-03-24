rule sqlserver
{
    meta:
        name = "sqlserver@4.0.5"

    strings:
        $name = /"name":\s"sqlserver",/
        $version = /"version":\s"4.0.5"/

    condition:
        all of them
}