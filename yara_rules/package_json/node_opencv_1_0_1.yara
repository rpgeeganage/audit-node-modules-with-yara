rule node_opencv
{
    meta:
        name = "node-opencv@1.0.1"

    strings:
        $name = /"name":\s"node-opencv",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}