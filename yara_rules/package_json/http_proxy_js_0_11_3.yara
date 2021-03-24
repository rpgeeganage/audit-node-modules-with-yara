rule http_proxy_js
{
    meta:
        name = "http-proxy.js@0.11.3"

    strings:
        $name = /"name":\s"http-proxy.js",/
        $version = /"version":\s"0.11.3"/

    condition:
        all of them
}