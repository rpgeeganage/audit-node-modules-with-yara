# Audit Node Modules With YARA Rules
## Table of content
+ [Why](#why)
+ [Software Requirements](#software-requirements)
+ [How to use](#how-to-use)
+ [CI/CD integration](#cicd-integration)
+ [Adding YARA new rules](#adding-yara-new-rules)
## Why
* The purpose of this tool is to run a given set of `YARA` rules against the given `node_module` folder.
* With this approach, We can define `YARA` rules to identify suspicious scripts which are injected into node packages.
* Mainly inspired by these articles.

  * [Malicious packages in npm. Here’s what to do](https://iamakulov.com/notes/npm-malicious-packages/)
  * [Malicious NPM packages target Amazon, Slack with new dependency attacks](https://www.bleepingcomputer.com/news/security/malicious-npm-packages-target-amazon-slack-with-new-dependency-attacks/)
  * [Hunting malicious NPM packages](https://duo.com/decipher/hunting-malicious-npm-packages)

* This package can be added to the `CI/CD` pipeline as mentioned below ([CI/CD integration](#cicd-integration)).

## Software Requirements
* Docker
* Docker Compose
* Makefile

## How to use
1. Clone this repo
```sh
git clone https://github.com/rpgeeganage/audit-node-modules-with-yara.git
```
2. Execute audit operation
```sh
make NODE_MODULE_FOLDER_TO_AUDIT=<path to node_module> run
```
#### e.g:
```sh
make NODE_MODULE_FOLDER_TO_AUDIT=../restful4up/node_modules run
```
## Report
The report is available in `artifacts/output.json`.

#### A sample report looks as follows
```json
[
 {
  "rule": "nodecaffe",
  "string_information": [
   "0x6:$name: \"name\": \"nodecaffe\",",
   "0x1f:$version: \"version\": \"0.0.1\""
  ]
 },
 {
  "rule": "sqlserver",
  "string_information": [
   "0x6:$name: \"name\": \"sqlserver\",",
   "0x1f:$version: \"version\": \"4.0.5\""
  ]
 }
]
```
## CI/CD Integration
We can use this tool with `CI/CD` as mentioned below.
```sh
#!/bin/bash
make NODE_MODULE_FOLDER_TO_AUDIT=../restful4up/node_modules run

suspicious_file_count=$(jq length artifacts/output.json)

exit $suspicious_file_count
```

## Adding YARA new rules
When we need to add new `YARA` rules, they must be added to the `yara_rules` folder.
### Sample YARA rule
```txt
rule babelcli
{
    meta:
        name = "babelcli@1.0.1"

    strings:
        $name = /"name":\s"babelcli",/
        $version = /"version":\s"1.0.1"/

    condition:
        all of them
}
```
#
# NEW RULES, FEEDBACKS, PRs are highly appreciated.