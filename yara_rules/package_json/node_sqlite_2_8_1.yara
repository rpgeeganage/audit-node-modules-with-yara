rule node_sqlite
{
    meta:
        name = "node-sqlite@2.8.1"

    strings:
        $name = /"name":\s"node-sqlite",/
        $version = /"version":\s"2.8.1"/

    condition:
        all of them
}