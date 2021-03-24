rule tkinter
{
    meta:
        name = "tkinter@1.0.1"

    strings:
        $name = /"name":\s"tkinter",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}