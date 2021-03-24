rule proxy_js
{
    meta:
        name = "proxy.js@0.11.3"

    strings:
        $name = /"name":\s"proxy.js",/
        $version = /"version":\s"0.11.3"/

    condition:
        all of them
}