# Project Templater

## genit

> Creates a new repo with jujutsu as the main VCS

```nu
let template = (
    ls _templates/*
    | where type == dir
    | get name
    | each { str replace "_templates/" "" }
    | str join (char nl)
    | fzf --preview-window hidden;
)
print $" (ansi green_bold)=>(ansi reset) Selected: (ansi yellow_bold)($template)(ansi reset)"

let name = (input $" (ansi green_bold)=>(ansi reset) Project Name: (ansi yellow_bold)")
let path = ($name | str downcase | str kebab-case)

let desc = (input $" (ansi green_bold)=>(ansi reset) Project Description: (ansi yellow_bold)")

if not ($path | path exists) {
    cp --recursive (["_templates" $template] | path join) $path
} else {
    print $"(ansi red_bold) Error: (ansi yellow_bold)./($path) (ansi red_bold)exists.(ansi reset)"
}

cd $path

rg --no-follow --files-with-matches GENIT_PROJECT_*
| lines
| each {|e|
    $e
    | open --raw
    | lines
    | each {
        if ($in | str contains "GENIT_PROJECT_") {
            $in
            | str replace --all "GENIT_PROJECT_PATH" $path
            | str replace --all "GENIT_PROJECT_NAME" $name
            | str replace --all "GENIT_PROJECT_DESCRIPTION" $desc
        } else {
            return $in
        }
    }
    | to text
    | collect
    | save --force $e
}
| ignore

print $" (ansi green_bold)::(ansi reset) Created new project at (ansi green_bold)(pwd)(ansi reset)"
print ""

jj git init --colocate --quiet
jj describe -m "Initial commit" --quiet
jj new

direnv allow
```
