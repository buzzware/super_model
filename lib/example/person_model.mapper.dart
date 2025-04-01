// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'person_model.dart';

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
