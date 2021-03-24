
# Audit Node Modules With YARA Rules
### (New Rules, Feedbacks, PRs are highly appreciated)

## Table of content
+ [Purpose](#purpose)
+ [Software Requirements](#software-requirements)
+ [How to use](#how-to-use)
+ [CI/CD integration](#cicd-integration)
+ [Adding YARA new rules](#adding-yara-new-rules)
## Purpose
* The purpose of this tool is to run a given set of [`YARA`](https://yara.readthedocs.io/en/stable/) rules against the given `node_module` folder.
* With this approach, We can define [`YARA`](https://yara.readthedocs.io/en/stable/) rules to identify suspicious scripts which are injected into node packages.
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
  "rule": "evil_package_1",
  "string_information": [
   "0x6:$name: \"name\": \"nodecaffe\",",
   "0x1f:$version: \"version\": \"0.0.1\""
  ]
 },
 {
  "rule": "evil_package_2",
  "string_information": [
   "0x6:$name: \"name\": \"sqlserver\",",
   "0x1f:$version: \"version\": \"4.0.5\""
  ]
 },
 {
  "rule": "evil_package_3",
  "string_information": [
   "0x1d:$scripts: \"scripts\":",
   "0x39:$install: \"mkdir -p ~/Desktop/sploit && touch ~/Desktop/sploit/haxx\""
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
When we need to add new `YARA` rules, they must be added to the `yara_rules` folder with extension `.yara`.

**(Existing rules are created based on [this](https://iamakulov.com/notes/npm-malicious-packages/) article. They might be outdated)**

### Sample YARA rule
#### Let's create a rule for [this](https://gist.github.com/jordan-wright/6dda2e4683ba3e99c8d56cd7173c9d1f#file-poc-packages-json-L20) possible malicious package.
A possible rule is as below.
```txt
rule evil
{
    meta:
        name = "evil@0.0.1"

    strings:
        $scripts = /"scripts":/
        $install = /"mkdir -p ~\/Desktop\/sploit && touch ~\/Desktop\/sploit\/haxx"/

    condition:
        all of them
}
```
Save this rule in `yara_rules` folder as `evil.yara`, and good to go
