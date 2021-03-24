rule mssql_js
{
    meta:
        name = "mssql.js@4.0.5"

    strings:
        $name = /"name":\s"mssql.js",/
        $version = /"version":\s"4.0.5"/

    condition:
        all of them
}