#!/bin/zsh
rm -rf .dart_tool && rm -rf build && clear && dart --enable-experiment=macros --verbose test --reporter=expanded test/animal_test.dart

