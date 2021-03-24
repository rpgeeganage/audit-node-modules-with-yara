rule nodemailer_js
{
    meta:
        name = "nodemailer.js@4.0.1"

    strings:
        $name = /"name":\s"nodemailer.js",/
        $version = /"version":\s"4.0.1"/

    condition:
        all of them
}