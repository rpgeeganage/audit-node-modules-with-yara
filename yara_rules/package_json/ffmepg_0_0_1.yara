rule ffmepg
{
    meta:
        name = "ffmepg@0.0.1"

    strings:
        $name = /"name":\s"ffmepg",/
        $version = /"version":\s"0.0.1"/

    condition:
        all of them
}