# NAME

**GENIT_PROJECT_NAME** - GENIT_PROJECT_DESCRIPTION

# SYNOPSIS

GENIT_PROJECT_PATH [**-h|--help**]<br>
GENIT_PROJECT_PATH [**-v|--version**]<br>

# DESCRIPTION

TBD

# MASKFILE RULES

This section contains commands for the task runner **mask**. If you're not a
developer, you may skip to the next section. Otherwise, please install the
following dev-dependencies:

* **mask**
* **nushell**
* **pandoc**

NOTE: The scripts below may deviate slighty from the maskfile source due to the
way **pandoc** handles conversions to the \*roff format.

## build

> Builds the program

**OPTIONS**
* release
  * flags: --release
  * desc: Build with release mode

```nu
if $env.release? == "true" {
	cargo build --release
} else {
	cargo build
}
```

## run

> Runs the program

**OPTIONS**
* release
  * flags: --release
  * desc: Build with release mode

```nu
if $env.release? == "true" {
	cargo run --release
} else {
	cargo run
}
```

## man

> Builds the manpage from the maskfile.md source file

```nu
open Cargo.toml
| do {
    let mansection = 1 # Executables or shell commands
    let root = (cargo locate-project | from json | get root | path dirname)
    let ver = ($in | get package | get version)
    let name = ($in | get package | get name)
    let bin = (
        $in
        | if bin in $in {
            $in.bin.name.0
        } else {
            $in.package.name
        }
    )

    ./docs/manpage.nu --root $root --ver $ver --name $name --bin $bin --mansection $mansection
    # man $"([$root "docs/man"] | path join)/($bin).($mansection).zst"
}
```

# ACKNOWLEDGEMENTS

- TBD

# BUGS

Report issues at: <https://github.com/yilisharcs/GENIT_PROJECT_PATH/issues>

# AUTHOR

yilisharcs <yilisharcs@gmail.com>

# SEE ALSO

Website: <https://github.com/yilisharcs/GENIT_PROJECT_PATH>

How to make manpages with markdown:

* <https://www.dlab.ninja/2021/10/how-to-write-manpages-with-markdown-and.html>
* <https://pandoc.org/MANUAL.html#metadata-blocks>

# LICENSE

Copyright (C) 2025 yilisharcs <yilisharcs@gmail.com>

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program. If not, see <https://www.gnu.org/licenses/>.
