// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'person_model.dart';

class PersonMapper extends ClassMapperBase<Person> {
  PersonMapper._();

  static PersonMapper? _instance;
  static PersonMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PersonMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Person';

  static int _$_id(Person v) => v._id;
  static const Field<Person, int> _f$_id = Field('_id', _$_id, key: 'id');
  static String _$_name(Person v) => v._name;
  static const Field<Person, String> _f$_name =
      Field('_name', _$_name, key: 'name');
  static int _$_age(Person v) => v._age;
  static const Field<Person, int> _f$_age = Field('_age', _$_age, key: 'age');
  static String? _$_email(Person v) => v._email;
  static const Field<Person, String> _f$_email =
      Field('_email', _$_email, key: 'email', opt: true);

  @override
  final MappableFields<Person> fields = const {
    #_id: _f$_id,
    #_name: _f$_name,
    #_age: _f$_age,
    #_email: _f$_email,
  };

  static Person _instantiate(DecodingData data) {
    return Person(
        id: data.dec(_f$_id),
        name: data.dec(_f$_name),
        age: data.dec(_f$_age),
        email: data.dec(_f$_email));
  }

  @override
  final Function instantiate = _instantiate;

  static Person fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Person>(map);
  }

  static Person fromJson(String json) {
    return ensureInitialized().decodeJson<Person>(json);
  }
}

mixin PersonMappable {
  String toJson() {
    return PersonMapper.ensureInitialized().encodeJson<Person>(this as Person);
  }

  Map<String, dynamic> toMap() {
    return PersonMapper.ensureInitialized().encodeMap<Person>(this as Person);
  }

  PersonCopyWith<Person, Person, Person> get copyWith =>
      _PersonCopyWithImpl(this as Person, $identity, $identity);
  @override
  String toString() {
    return PersonMapper.ensureInitialized().stringifyValue(this as Person);
  }

  @override
  bool operator ==(Object other) {
    return PersonMapper.ensureInitialized().equalsValue(this as Person, other);
  }

  @override
  int get hashCode {
    return PersonMapper.ensureInitialized().hashValue(this as Person);
  }
}

extension PersonValueCopy<$R, $Out> on ObjectCopyWith<$R, Person, $Out> {
  PersonCopyWith<$R, Person, $Out> get $asPerson =>
      $base.as((v, t, t2) => _PersonCopyWithImpl(v, t, t2));
}

abstract class PersonCopyWith<$R, $In extends Person, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, int? age, String? email});
  PersonCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _PersonCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Person, $Out>
    implements PersonCopyWith<$R, Person, $Out> {
  _PersonCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Person> $mapper = PersonMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, int? age, Object? email = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (age != null) #age: age,
        if (email != $none) #email: email
      }));
  @override
  Person $make(CopyWithData data) => Person(
      id: data.get(#id, or: $value._id),
      name: data.get(#name, or: $value._name),
      age: data.get(#age, or: $value._age),
      email: data.get(#email, or: $value._email));

  @override
  PersonCopyWith<$R2, Person, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _PersonCopyWithImpl($value, $cast, t);
}

class EmployeeMapper extends ClassMapperBase<Employee> {
  EmployeeMapper._();

  static EmployeeMapper? _instance;
  static EmployeeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EmployeeMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Employee';

  static int _$id(Employee v) => v.id;
  static const Field<Employee, int> _f$id = Field('id', _$id);
  static String _$name(Employee v) => v.name;
  static const Field<Employee, String> _f$name = Field('name', _$name);
  static String _$position(Employee v) => v.position;
  static const Field<Employee, String> _f$position =
      Field('position', _$position);
  static double _$salary(Employee v) => v.salary;
  static const Field<Employee, double> _f$salary = Field('salary', _$salary);

  @override
  final MappableFields<Employee> fields = const {
    #id: _f$id,
    #name: _f$name,
    #position: _f$position,
    #salary: _f$salary,
  };

  static Employee _instantiate(DecodingData data) {
    return Employee(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        position: data.dec(_f$position),
        salary: data.dec(_f$salary));
  }

  @override
  final Function instantiate = _instantiate;

  static Employee fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Employee>(map);
  }

  static Employee fromJson(String json) {
    return ensureInitialized().decodeJson<Employee>(json);
  }
}

mixin EmployeeMappable {
  String toJson() {
    return EmployeeMapper.ensureInitialized()
        .encodeJson<Employee>(this as Employee);
  }

  Map<String, dynamic> toMap() {
    return EmployeeMapper.ensureInitialized()
        .encodeMap<Employee>(this as Employee);
  }

  EmployeeCopyWith<Employee, Employee, Employee> get copyWith =>
      _EmployeeCopyWithImpl(this as Employee, $identity, $identity);
  @override
  String toString() {
    return EmployeeMapper.ensureInitialized().stringifyValue(this as Employee);
  }

  @override
  bool operator ==(Object other) {
    return EmployeeMapper.ensureInitialized()
        .equalsValue(this as Employee, other);
  }

  @override
  int get hashCode {
    return EmployeeMapper.ensureInitialized().hashValue(this as Employee);
  }
}

extension EmployeeValueCopy<$R, $Out> on ObjectCopyWith<$R, Employee, $Out> {
  EmployeeCopyWith<$R, Employee, $Out> get $asEmployee =>
      $base.as((v, t, t2) => _EmployeeCopyWithImpl(v, t, t2));
}

abstract class EmployeeCopyWith<$R, $In extends Employee, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? name, String? position, double? salary});
  EmployeeCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EmployeeCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Employee, $Out>
    implements EmployeeCopyWith<$R, Employee, $Out> {
  _EmployeeCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Employee> $mapper =
      EmployeeMapper.ensureInitialized();
  @override
  $R call({int? id, String? name, String? position, double? salary}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (position != null) #position: position,
        if (salary != null) #salary: salary
      }));
  @override
  Employee $make(CopyWithData data) => Employee(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      position: data.get(#position, or: $value.position),
      salary: data.get(#salary, or: $value.salary));

  @override
  EmployeeCopyWith<$R2, Employee, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EmployeeCopyWithImpl($value, $cast, t);
}

class DepartmentMapper extends ClassMapperBase<Department> {
  DepartmentMapper._();

  static DepartmentMapper? _instance;
  static DepartmentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = DepartmentMapper._());
      EmployeeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Department';

  static int _$id(Department v) => v.id;
  static const Field<Department, int> _f$id = Field('id', _$id);
  static String _$name(Department v) => v.name;
  static const Field<Department, String> _f$name = Field('name', _$name);
  static List<Employee> _$employees(Department v) => v.employees;
  static const Field<Department, List<Employee>> _f$employees =
      Field('employees', _$employees);

  @override
  final MappableFields<Department> fields = const {
    #id: _f$id,
    #name: _f$name,
    #employees: _f$employees,
  };

  static Department _instantiate(DecodingData data) {
    return Department(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        employees: data.dec(_f$employees));
  }

  @override
  final Function instantiate = _instantiate;

  static Department fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Department>(map);
  }

  static Department fromJson(String json) {
    return ensureInitialized().decodeJson<Department>(json);
  }
}

mixin DepartmentMappable {
  String toJson() {
    return DepartmentMapper.ensureInitialized()
        .encodeJson<Department>(this as Department);
  }

  Map<String, dynamic> toMap() {
    return DepartmentMapper.ensureInitialized()
        .encodeMap<Department>(this as Department);
  }

  DepartmentCopyWith<Department, Department, Department> get copyWith =>
      _DepartmentCopyWithImpl(this as Department, $identity, $identity);
  @override
  String toString() {
    return DepartmentMapper.ensureInitialized()
        .stringifyValue(this as Department);
  }

  @override
  bool operator ==(Object other) {
    return DepartmentMapper.ensureInitialized()
        .equalsValue(this as Department, other);
  }

  @override
  int get hashCode {
    return DepartmentMapper.ensureInitialized().hashValue(this as Department);
  }
}

extension DepartmentValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Department, $Out> {
  DepartmentCopyWith<$R, Department, $Out> get $asDepartment =>
      $base.as((v, t, t2) => _DepartmentCopyWithImpl(v, t, t2));
}

abstract class DepartmentCopyWith<$R, $In extends Department, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Employee, EmployeeCopyWith<$R, Employee, Employee>>
      get employees;
  $R call({int? id, String? name, List<Employee>? employees});
  DepartmentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _DepartmentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Department, $Out>
    implements DepartmentCopyWith<$R, Department, $Out> {
  _DepartmentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Department> $mapper =
      DepartmentMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Employee, EmployeeCopyWith<$R, Employee, Employee>>
      get employees => ListCopyWith($value.employees,
          (v, t) => v.copyWith.$chain(t), (v) => call(employees: v));
  @override
  $R call({int? id, String? name, List<Employee>? employees}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (employees != null) #employees: employees
      }));
  @override
  Department $make(CopyWithData data) => Department(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      employees: data.get(#employees, or: $value.employees));

  @override
  DepartmentCopyWith<$R2, Department, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _DepartmentCopyWithImpl($value, $cast, t);
}
