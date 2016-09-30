# Rusty `.blank?`

[![Travis CI Status](https://travis-ci.org/malept/rusty_blank.svg?branch=master)](https://travis-ci.org/malept/rusty_blank)
[![AppVeyor status](https://ci.appveyor.com/api/projects/status/padl7o13sg6o1ob8?svg=true)](https://ci.appveyor.com/project/malept/rusty-blank)

A very simple Ruby extension that speeds up ActiveSupport's `String.blank?` method. The point of
this repository is not to distribute [another `.blank?`
speedup](https://github.com/SamSaffron/fast_blank), but to research and implement building and
distributing a Ruby + Rust extension that does not necessarily need a Rust compiler present in order
to build the Ruby extension proper.

## [Contributing](https://github.com/malept/rusty_blank/blob/master/CONTRIBUTING.md)

## Legal

This repository is copyrighted under the MIT license, unless otherwise specified.
