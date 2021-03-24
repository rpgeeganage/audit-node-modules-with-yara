rule shadowsock
{
    meta:
        name = "shadowsock@2.0.1"

    strings:
        $name = /"name":\s"shadowsock",/
        $version = /"version":\s"2.0.1"/

    condition:
        all of them
}