rule mongose
{
    meta:
        name = "mongose@4.11.3"

    strings:
        $name = /"name":\s"mongose",/
        $version = /"version":\s"4.11.3"/

    condition:
        all of them
}