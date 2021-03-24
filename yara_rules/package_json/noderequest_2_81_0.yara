rule noderequest
{
    meta:
        name = "noderequest@2.81.0"

    strings:
        $name = /"name":\s"noderequest",/
        $version = /"version":\s"2.81.0"/

    condition:
        all of them
}