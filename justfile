FONT_PATH := "src/assets/fonts"

# List recipes
_default:
    @just --list

_mkdir:
    @mkdir --parents build

alias x := clean
# Clean the repository
clean:
    @rm -rf build

alias l := lint
# Lint the files
lint:
    @typstyle \
        --verbose \
        --inplace \
        --line-width 80 \
        --indent-width 2 \
        --wrap-text \
        src

alias b := build
# Build the given example
build EXAMPLE: _mkdir lint
    typst compile \
        --font-path {{FONT_PATH}} \
        --format pdf \
        --root src \
        src/lib/{{EXAMPLE}}/main.typ \
        build/{{EXAMPLE}}.pdf

alias f := fonts
# List all available fonts
fonts:
    @typst fonts \
        --font-path {{FONT_PATH}}
