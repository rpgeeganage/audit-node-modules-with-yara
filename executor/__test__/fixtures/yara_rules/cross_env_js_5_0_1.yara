rule cross_env_js
{
    meta:
        name = "cross-env.js@5.0.1"

    strings:
        $name = /"name":\s"cross-env.js",/
        $version = /"version":\s"5.0.1"/

    condition:
        all of them
}