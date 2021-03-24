rule nodecaffe
{
    meta:
        name = "nodecaffe@0.0.1"

    strings:
        $name = /"name":\s"nodecaffe",/
        $version = /"version":\s"0.0.1"/

    condition:
        all of them
}