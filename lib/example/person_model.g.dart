// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************
class EmployeeMappableFields {
  static const String $id = 'id';
  static const String $name = 'name';
  static const String $position = 'position';
  static const String $salary = 'salary';
  static const fromJson = EmployeeMapper.fromJson;
  static const fromMap = EmployeeMapper.fromMap;
  static const $fromJson = EmployeeMapper.fromJson;
  static const $fromMap = EmployeeMapper.fromMap;
  static Map<String, dynamic Function(Employee)> _$getters = {
    $id: (Employee o) => o.id,
    $name: (Employee o) => o.name,
    $position: (Employee o) => o.position,
    $salary: (Employee o) => o.salary,
  };
}

mixin EmployeeMappableMixin on SuperModelBase implements ISuperModel {
  @override
  ModelClassMeta get $classMeta => EmployeeSuperModelGeneratedFields.$meta;
  @override
  M $copyWithMap<M>(Map<String, dynamic> map) {
    final mergedMap = {...(this as Employee).toMap(), ...map};
    return EmployeeMappableFields.fromMap(mergedMap) as M;
  }

  @override
  T? $get<T>(String key, [T? defaultValue]) {
    final getter = EmployeeMappableFields._$getters[key];
    if (getter == null) return defaultValue;
    return getter(this as Employee) as T?;
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

  dynamic operator [](String key) {
    final getter = EmployeeMappableFields._$getters[key];
    return getter == null ? null : getter(this as Employee);
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

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
extension PersonSuperModelGeneratedFields on Person {
  static const String $id = "id";
  static const String $name = "name";
  static const String $age = "age";
  static const String $email = "email";
  static const ModelClassMeta $meta = ModelClassMeta(Person, null, "id", int, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $age: const PropertyMeta($age, int, false, 'int', 'int'),
    $email: const PropertyMeta($email, String, true, 'String', 'String?'),
  });
}

mixin PersonMeta on SuperModelBase {
  @override
  Map<String, dynamic Function(SuperModelBase)> get $getters => {
        "id": (o) => (o as Person).id,
        "name": (o) => (o as Person).name,
        "age": (o) => (o as Person).age,
        "email": (o) => (o as Person).email
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter(this);
  }

  @override
  ModelClassMeta get $classMeta => PersonSuperModelGeneratedFields.$meta;
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
extension EmployeeSuperModelGeneratedFields on Employee {
  static const String $id = "id";
  static const String $name = "name";
  static const String $position = "position";
  static const String $salary = "salary";
  static const ModelClassMeta $meta =
      ModelClassMeta(Employee, null, "id", int, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $position: const PropertyMeta($position, String, false, 'String', 'String'),
    $salary: const PropertyMeta($salary, double, false, 'double', 'double'),
  });
}

mixin EmployeeMeta on SuperModelBase {
  @override
  Map<String, dynamic Function(SuperModelBase)> get $getters => {
        "id": (o) => (o as Employee).id,
        "name": (o) => (o as Employee).name,
        "position": (o) => (o as Employee).position,
        "salary": (o) => (o as Employee).salary
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter(this);
  }

  @override
  ModelClassMeta get $classMeta => EmployeeSuperModelGeneratedFields.$meta;
}

// **************************************************************************
// SuperModelGenerator
// **************************************************************************
extension DepartmentSuperModelGeneratedFields on Department {
  static const String $id = "id";
  static const String $name = "name";
  static const String $employees = "employees";
  static const ModelClassMeta $meta =
      ModelClassMeta(Department, null, "id", int, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $employees: const PropertyMeta($employees, List, false, 'List', 'List'),
  });
}

mixin DepartmentMeta on SuperModelBase {
  @override
  Map<String, dynamic Function(SuperModelBase)> get $getters => {
        "id": (o) => (o as Department).id,
        "name": (o) => (o as Department).name,
        "employees": (o) => (o as Department).employees
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter(this);
  }

  @override
  ModelClassMeta get $classMeta => DepartmentSuperModelGeneratedFields.$meta;
}
