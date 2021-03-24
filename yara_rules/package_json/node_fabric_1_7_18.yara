rule node_fabric
{
    meta:
        name = "node-fabric@1.7.18"

    strings:
        $name = /"name":\s"node-fabric",/
        $version = /"version":\s"1.7.18"/

    condition:
        all of them
}