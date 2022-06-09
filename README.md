# QuPath Homebrew tap

## What's this for?

This is an experimental repo for exploring how to get QuPath working nicely on
Apple Silicon.

It doesn't actually include QuPath itself, but rather focusses on native
library dependencies that are hard to distribute in a portable way.

Currently, it (tries to) give a way to build `openslide-java` locally so that
QuPath can use it.
`homebrew-core` already includes `openslide`, but we need the Java bindings
to get it to work in QuPath.

## How do I install these formulae?

`brew install petebankhead/qupath/<formula>`

Or `brew tap petebankhead/qupath` and then `brew install <formula>`.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
