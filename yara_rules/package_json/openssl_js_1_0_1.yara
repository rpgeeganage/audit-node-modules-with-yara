rule openssl_js
{
    meta:
        name = "openssl.js@1.0.1"

    strings:
        $name = /"name":\s"openssl.js",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}