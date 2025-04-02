import 'package:dart_mappable/dart_mappable.dart';
import 'package:super_model/super_model.dart';

part 'person_model.mapper.dart';
part 'person_model.g.dart'; // Generated code will be placed here

@SuperModel()
@MappableSuperModel()
@MappableClass()
class Person extends SuperModelBase with PersonMappable, PersonMeta {
  // Mark id field with SuperModelId annotation
  @SuperModelId()
  final int _id;

  final String _name;
  final int _age;
  final String? _email;

  // Constructor remains the same
  Person({
    required int id,
    required String name,
    required int age,
    String? email,
  }) :
    _id = id,
    _name = name,
    _age = age,
    _email = email;

  int get id => _id;
  String get name => _name;
  int get age => _age;
  String? get email => _email;

  // Simple toMap implementation
  //Map<String, dynamic> toMap() => {'id': id, 'name': name, 'age': age, 'email': email};
}

// Example of a model that integrates with mappable functionality
@SuperModel()
@MappableSuperModel()
@MappableClass()
class Employee extends SuperModelBase with EmployeeMappable, EmployeeMeta, EmployeeMappableMixin {
  @SuperModelId()
  final int id;

  final String name;
  final String position;
  final double salary;

  // Constructor for the model
  Employee({
    required this.id,
    required this.name,
    required this.position,
    required this.salary,
  });

  // // Simple toMap implementation
  // Map<String, dynamic> toMap() => {'id': id, 'name': name, 'position': position, 'salary': salary};
  //
  // // Simple toJson implementation
  // String toJson() => jsonEncode(toMap());
}

@SuperModel()
@MappableSuperModel()
@MappableClass()
class Department extends SuperModelBase with EmployeeMappable, DepartmentMeta {
  @SuperModelId()
  final int id;

  final String name;

  @BelongsTo(foreignKey: 'departmentId')
  final List<Employee> employees;

  Department({
    required this.id,
    required this.name,
    required this.employees,
  });

  // Simple toMap implementation
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'employees': employees.map((e) => e.toMap()).toList(),
  };
}
