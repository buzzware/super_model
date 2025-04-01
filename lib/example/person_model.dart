import 'package:super_model/super_model.dart';

part 'person_model.g.dart'; // Generated code will be placed here

// Use annotation instead of macro
@SuperModel()
class Person extends SuperModelBase with PersonSuperModelMixin {
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
    
  // Getters
  int get id => _id;
  String get name => _name;
  int get age => _age;
  String? get email => _email;

  // Simple toMap implementation
  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'age': age, 'email': email};
}

// Example of a model that integrates with mappable functionality
@SuperModel()
@MappableSuperModel()
class Employee extends SuperModelBase with EmployeeSuperModelMixin, EmployeeMappableMixin {
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
  
  // Simple toMap implementation
  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'position': position, 'salary': salary};
  
  // Simple toJson implementation
  String toJson() => jsonEncode(toMap());
}

// Example of using BelongsTo relationship
@SuperModel()
class Department extends SuperModelBase with DepartmentSuperModelMixin {
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
  
  // Simple toJson implementation
  String toJson() => jsonEncode(toMap());
}
