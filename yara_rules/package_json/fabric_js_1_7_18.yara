rule fabric_js
{
    meta:
        name = "fabric-js@1.7.18"

    strings:
        $name = /"name":\s"fabric-js",/
        $version = /"version":\s"1.7.18"/

    condition:
        all of them
}