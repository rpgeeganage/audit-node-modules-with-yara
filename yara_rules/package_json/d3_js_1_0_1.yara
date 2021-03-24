rule d3_js
{
    meta:
        name = "d3.js@1.0.1"

    strings:
        $name = /"name":\s"d3.js",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}