rule node_opensl
{
    meta:
        name = "node-opensl@1.0.1"

    strings:
        $name = /"name":\s"node-opensl",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}