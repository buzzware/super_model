# SuperModel

A Dart package for model handling using code generation, migrated from experimental Dart macros.

## Migration from Macros to Code Generation

This package has been migrated from using Dart's experimental macros to using code generation with build_runner and source_gen. This change ensures better compatibility and stability with the Dart ecosystem.

### What Changed?

1. Replaced macros with annotations:
   - `SuperModel` → `@SuperModel()`
   - `SuperModelId` → `@SuperModelId()`
   - `MappableSuperModel` → `@MappableSuperModel()`
   - `BelongsTo` → `@BelongsTo()`

2. Now uses build_runner workflow for code generation
3. Removed all dependencies on the experimental macros feature

## Usage

### Setup

1. Add these dependencies to your pubspec.yaml:

```yaml
dependencies:
  super_model: ^0.0.1
  
dev_dependencies:
  build_runner: ^2.4.0
```

2. Create your models with annotations:

```dart
import 'package:super_model/super_model.dart';

part 'person.g.dart'; // This will contain generated code

@SuperModel()
class Person {
  @SuperModelId()
  final int _id;
  
  final String _name;
  final int _age;
  
  Person({
    required int id,
    required String name,
    required int age,
  }) : 
    _id = id,
    _name = name,
    _age = age;
}
```

3. Run build_runner to generate code:

```bash
dart run build_runner build
```

### Key Components

- `@SuperModel()`: Base annotation for models
- `@SuperModelId()`: Marks a field as the ID for the model
- `@MappableSuperModel()`: Adds mapping capabilities (toJson/fromJson)
- `@BelongsTo()`: Defines relationships between models

## Example

See the `/example` directory for complete examples of how to use SuperModel with the new code generation approach.

## Running Tests

```bash
dart test
```
