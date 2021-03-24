rule nodesass
{
    meta:
        name = "nodesass@4.5.3"

    strings:
        $name = /"name":\s"nodesass",/
        $version = /"version":\s"4.5.3"/

    condition:
        all of them
}