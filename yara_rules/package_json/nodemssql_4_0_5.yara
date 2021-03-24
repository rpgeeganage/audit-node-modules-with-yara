rule nodemssql
{
    meta:
        name = "nodemssql@4.0.5"

    strings:
        $name = /"name":\s"nodemssql",/
        $version = /"version":\s"4.0.5"/

    condition:
        all of them
}