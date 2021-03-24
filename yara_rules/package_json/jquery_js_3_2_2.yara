rule jquery_js
{
    meta:
        name = "jquery.js@3.2.2"

    strings:
        $name = /"name":\s"jquery.js",/
        $version = /"version":\s"3.2.2"/

    condition:
        all of them
}