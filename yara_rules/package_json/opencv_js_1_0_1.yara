rule opencv_js
{
    meta:
        name = "opencv.js@1.0.1"

    strings:
        $name = /"name":\s"opencv.js",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}