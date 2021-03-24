rule node_tkinter
{
    meta:
        name = "node-tkinter@1.0.1"

    strings:
        $name = /"name":\s"node-tkinter",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}