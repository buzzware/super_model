// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// SuperModelGenerator
// **************************************************************************

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
mixin PersonMeta on SuperModelBase implements ISuperModel {
  static const String $id = "id";
  static const String $name = "name";
  static const String $age = "age";
  static const String $email = "email";
  static const fromJson = PersonMapper.fromJson;
  static const fromMap = PersonMapper.fromMap;
  static const $fromJson = PersonMapper.fromJson;
  static const $fromMap = PersonMapper.fromMap;
  static ModelClassMeta $meta = ModelClassMeta(Person, null, "id", int, {
    $id: PropertyMeta($id, int, false, 'int', 'int', (o) => (o as Person).id),
    $name: PropertyMeta(
        $name, String, false, 'String', 'String', (o) => (o as Person).name),
    $age:
        PropertyMeta($age, int, false, 'int', 'int', (o) => (o as Person).age),
    $email: PropertyMeta(
        $email, String, true, 'String', 'String?', (o) => (o as Person).email),
  });
  @override
  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }

  @override
  ModelClassMeta get $classMeta => $meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as Person).toMap(), ...map};
    return fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final property = $classMeta.fields[key];
    if (property == null) return defaultValue;
    return property.getValue(this) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    if (this is Person) {
      return (this as Person).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is Person) {
      return (this as Person).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  Person $copyWith({
    int? id,
    String? name,
    int? age,
    String? email,
  }) {
    final self = this as Person;
    return Person(
      id: id ?? self.id,
      name: name ?? self.name,
      age: age ?? self.age,
      email: email ?? self.email,
    );
  }
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
mixin EmployeeMeta on SuperModelBase implements ISuperModel {
  static const String $id = "id";
  static const String $name = "name";
  static const String $position = "position";
  static const String $salary = "salary";
  static const fromJson = EmployeeMapper.fromJson;
  static const fromMap = EmployeeMapper.fromMap;
  static const $fromJson = EmployeeMapper.fromJson;
  static const $fromMap = EmployeeMapper.fromMap;
  static ModelClassMeta $meta = ModelClassMeta(Employee, null, "id", int, {
    $id: PropertyMeta($id, int, false, 'int', 'int', (o) => (o as Employee).id),
    $name: PropertyMeta(
        $name, String, false, 'String', 'String', (o) => (o as Employee).name),
    $position: PropertyMeta($position, String, false, 'String', 'String',
        (o) => (o as Employee).position),
    $salary: PropertyMeta($salary, double, false, 'double', 'double',
        (o) => (o as Employee).salary),
  });
  @override
  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }

  @override
  ModelClassMeta get $classMeta => $meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as Employee).toMap(), ...map};
    return fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final property = $classMeta.fields[key];
    if (property == null) return defaultValue;
    return property.getValue(this) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    if (this is Employee) {
      return (this as Employee).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is Employee) {
      return (this as Employee).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  Employee $copyWith({
    int? id,
    String? name,
    String? position,
    double? salary,
  }) {
    final self = this as Employee;
    return Employee(
      id: id ?? self.id,
      name: name ?? self.name,
      position: position ?? self.position,
      salary: salary ?? self.salary,
    );
  }
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
mixin DepartmentMeta on SuperModelBase implements ISuperModel {
  static const String $id = "id";
  static const String $name = "name";
  static const String $employees = "employees";
  static const fromJson = DepartmentMapper.fromJson;
  static const fromMap = DepartmentMapper.fromMap;
  static const $fromJson = DepartmentMapper.fromJson;
  static const $fromMap = DepartmentMapper.fromMap;
  static ModelClassMeta $meta = ModelClassMeta(Department, null, "id", int, {
    $id: PropertyMeta(
        $id, int, false, 'int', 'int', (o) => (o as Department).id),
    $name: PropertyMeta($name, String, false, 'String', 'String',
        (o) => (o as Department).name),
    $employees: PropertyMeta($employees, List, false, 'List', 'List',
        (o) => (o as Department).employees),
  });
  @override
  dynamic operator [](String key) {
    final property = $classMeta.fields[key];
    return property?.getValue(this);
  }

  @override
  ModelClassMeta get $classMeta => $meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as Department).toMap(), ...map};
    return fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final property = $classMeta.fields[key];
    if (property == null) return defaultValue;
    return property.getValue(this) as T?;
  }

  @override
  Map<String, dynamic> $toMap() {
    if (this is Department) {
      return (this as Department).toMap();
    }
    throw UnimplementedError("toMap() not implemented in ${this.runtimeType}");
  }

  @override
  String $toJson() {
    if (this is Department) {
      return (this as Department).toJson();
    }
    throw UnimplementedError("toJson() not implemented in ${this.runtimeType}");
  }

  Department $copyWith({
    int? id,
    String? name,
    List<Employee>? employees,
  }) {
    final self = this as Department;
    return Department(
      id: id ?? self.id,
      name: name ?? self.name,
      employees: employees ?? self.employees,
    );
  }
}
