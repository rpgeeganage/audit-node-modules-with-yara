rule sqlite_js
{
    meta:
        name = "sqlite.js@2.8.1"

    strings:
        $name = /"name":\s"sqlite.js",/
        $version = /"version":\s"2.8.1"/

    condition:
        all of them
}