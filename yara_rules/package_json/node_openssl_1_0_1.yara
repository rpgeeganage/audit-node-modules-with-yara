rule node_openssl
{
    meta:
        name = "node-openssl@1.0.1"

    strings:
        $name = /"name":\s"node-openssl",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}