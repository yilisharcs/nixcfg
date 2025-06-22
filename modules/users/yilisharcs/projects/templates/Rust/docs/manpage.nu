#!/usr/bin/env nu

def main [
  --root: string
  --ver: string
  --name: string
  --bin: string
  --mansection: int
] {
  let date = (date now | to text | split row " " | get 1 2 3 | str join " ")

  let mandir = ([$root "docs/man"] | path join)
  if ($mandir | path exists) {
    ls $mandir
    | where name =~ ".zst"
    | each { rm $in.name }
    | ignore
  } else {
    mkdir $mandir
  }

  open maskfile.md
  | lines
  | insert 0 $"% ($bin)\(($mansection)\) ($bin) ($ver) | ($name) Manual"
  | insert 1 "%"
  | insert 2 $"% ($date)"
  | insert 3 ""
  | each {
    # Tab char (^I)
    $in | str replace --all "	" "  "
  }
  | each {
    if ($in | str starts-with "# ") {
      prepend (char hamburger)
    } else {
      return $in
    }
  }
  | flatten
  | to text
  | split row (char hamburger)
  | do {
    let synopsis_index = (
      $in
      | enumerate
      | where $it.item =~ "# SYNOPSIS"
      | first
      | get index
    )
    let mask_index = (
      $in
      | enumerate
      | where $it.item =~ "# MASKFILE RULES"
      | first
      | get index
    )

    $in
    | update $synopsis_index {
      lines
      | skip 1
      | drop
      | each {
        if not ($in | str starts-with "# ") {
          str replace --regex "^" "| "
        } else {
          return $in
        }
      }
      | to text
    }
    | update $mask_index {
      lines
      | enumerate
      | do {
        let subheader = (
          $in
          | skip until { $in.item | str starts-with "## " }
          | first
          | get index
        )

        $in
        | each {
          if ($in.item | is-empty) or ($in.index < $subheader) {
            return $in.item
          } else if ($in.item | str starts-with "> ") {
            $in.item
            | str replace -r "^" "|"
            | prepend ""
            | append ""
          } else if ($in.item | str starts-with "~") and not ($in.item | str ends-with "~") {
            $in.item
            | str replace -r "^" "| "
            | prepend ""
          } else if ($in.item | str starts-with "~") and ($in.item | str ends-with "~") {
            $in.item
            | str replace -r "^" "| "
            | append ""
          } else {
            $in.item
            | str replace -r "^" "| "
          }
        }
      } $in
      | to text
    }
  }
  | to text
  | pandoc --standalone --from markdown-smart-tex_math_dollars --to man
  | zstd --compress --force -19 -o $"($mandir)/($bin).($mansection).zst"
}
