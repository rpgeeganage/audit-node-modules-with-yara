rule smb
{
    meta:
        name = "smb@1.5.1"

    strings:
        $name = /"name":\s"smb",/
        $version = /"version":\s"1.5.1"/

    condition:
        all of them
}