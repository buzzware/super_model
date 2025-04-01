// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_model.dart';

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************

// **************************************************************************
// MappableSuperModelGenerator
// **************************************************************************
extension EmployeeMappableFields on Employee {
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
    final mergedMap = {...toMap(), ...map};
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
    return (this as Employee).toMap();
  }

  @override
  String $toJson() => (this as Employee).toJson();
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
  static const ModelClassMeta $meta = ModelClassMeta(Person,
      PersonSuperModelIdFields.idName, PersonSuperModelIdFields.idType, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $age: const PropertyMeta($age, int, false, 'int', 'int'),
    $email: const PropertyMeta($email, String, true, 'String', 'String?'),
  });
}

mixin PersonSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters => {
        "id": () => (this as Person).id,
        "name": () => (this as Person).name,
        "age": () => (this as Person).age,
        "email": () => (this as Person).email
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
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
  static const ModelClassMeta $meta = ModelClassMeta(Employee,
      EmployeeSuperModelIdFields.idName, EmployeeSuperModelIdFields.idType, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $position: const PropertyMeta($position, String, false, 'String', 'String'),
    $salary: const PropertyMeta($salary, double, false, 'double', 'double'),
  });
}

mixin EmployeeSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters => {
        "id": () => (this as Employee).id,
        "name": () => (this as Employee).name,
        "position": () => (this as Employee).position,
        "salary": () => (this as Employee).salary
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
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
  static const ModelClassMeta $meta = ModelClassMeta(
      Department,
      DepartmentSuperModelIdFields.idName,
      DepartmentSuperModelIdFields.idType, {
    $id: const PropertyMeta($id, int, false, 'int', 'int'),
    $name: const PropertyMeta($name, String, false, 'String', 'String'),
    $employees: const PropertyMeta($employees, List, false, 'List', 'List'),
  });
}

mixin DepartmentSuperModelMixin on SuperModelBase {
  @override
  Map<String, dynamic Function()> get $getters => {
        "id": () => (this as Department).id,
        "name": () => (this as Department).name,
        "employees": () => (this as Department).employees
      };
  @override
  dynamic operator [](String key) {
    var getter = $getters[key];
    if (getter == null) return null;
    return getter();
  }

  @override
  ModelClassMeta get $classMeta => DepartmentSuperModelGeneratedFields.$meta;
}
