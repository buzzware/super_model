#!/bin/zsh
rm -rf .dart_tool && rm -rf build && dart --enable-experiment=macros --verbose test --reporter=expanded test/simple_test.dart
