rule mysqljs
{
    meta:
        name = "mysqljs@2.13.0"

    strings:
        $name = /"name":\s"mysqljs",/
        $version = /"version":\s"2.13.0"/

    condition:
        all of them
}