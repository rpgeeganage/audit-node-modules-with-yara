rule mariadb
{
    meta:
        name = "mariadb@2.13.0"

    strings:
        $name = /"name":\s"mariadb",/
        $version = /"version":\s"2.13.0"/

    condition:
        all of them
}