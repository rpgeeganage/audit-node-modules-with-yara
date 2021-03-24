rule nodefabric
{
    meta:
        name = "nodefabric@1.7.18"

    strings:
        $name = /"name":\s"nodefabric",/
        $version = /"version":\s"1.7.18"/

    condition:
        all of them
}