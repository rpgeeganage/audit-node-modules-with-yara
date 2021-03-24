rule mssql_node
{
    meta:
        name = "mssql-node@4.0.5"

    strings:
        $name = /"name":\s"mssql-node",/
        $version = /"version":\s"4.0.5"/

    condition:
        all of them
}