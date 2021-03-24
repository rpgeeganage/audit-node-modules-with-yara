rule nodesqlite
{
    meta:
        name = "nodesqlite@2.8.1"

    strings:
        $name = /"name":\s"nodesqlite",/
        $version = /"version":\s"2.8.1"/

    condition:
        all of them
}