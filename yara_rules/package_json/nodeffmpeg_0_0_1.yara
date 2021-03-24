rule nodeffmpeg
{
    meta:
        name = "nodeffmpeg@0.0.1"

    strings:
        $name = /"name":\s"nodeffmpeg",/
        $version = /"version":\s"0.0.1"/

    condition:
        all of them
}