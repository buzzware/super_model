// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'design_test.dart';

class CarMapper extends ClassMapperBase<Car> {
  CarMapper._();

  static CarMapper? _instance;
  static CarMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CarMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Car';

  static int _$id(Car v) => v.id;
  static const Field<Car, int> _f$id = Field('id', _$id);
  static String _$name(Car v) => v.name;
  static const Field<Car, String> _f$name = Field('name', _$name);
  static int _$year(Car v) => v.year;
  static const Field<Car, int> _f$year = Field('year', _$year);
  static String? _$colour(Car v) => v.colour;
  static const Field<Car, String> _f$colour =
      Field('colour', _$colour, opt: true);
  static int? _$manufacturer_id(Car v) => v.manufacturer_id;
  static const Field<Car, int> _f$manufacturer_id =
      Field('manufacturer_id', _$manufacturer_id, opt: true);

  @override
  final MappableFields<Car> fields = const {
    #id: _f$id,
    #name: _f$name,
    #year: _f$year,
    #colour: _f$colour,
    #manufacturer_id: _f$manufacturer_id,
  };

  static Car _instantiate(DecodingData data) {
    return Car(
        id: data.dec(_f$id),
        name: data.dec(_f$name),
        year: data.dec(_f$year),
        colour: data.dec(_f$colour),
        manufacturer_id: data.dec(_f$manufacturer_id));
  }

  @override
  final Function instantiate = _instantiate;

  static Car fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Car>(map);
  }

  static Car fromJson(String json) {
    return ensureInitialized().decodeJson<Car>(json);
  }
}

mixin CarMappable {
  String toJson() {
    return CarMapper.ensureInitialized().encodeJson<Car>(this as Car);
  }

  Map<String, dynamic> toMap() {
    return CarMapper.ensureInitialized().encodeMap<Car>(this as Car);
  }

  CarCopyWith<Car, Car, Car> get copyWith =>
      _CarCopyWithImpl(this as Car, $identity, $identity);
  @override
  String toString() {
    return CarMapper.ensureInitialized().stringifyValue(this as Car);
  }

  @override
  bool operator ==(Object other) {
    return CarMapper.ensureInitialized().equalsValue(this as Car, other);
  }

  @override
  int get hashCode {
    return CarMapper.ensureInitialized().hashValue(this as Car);
  }
}

extension CarValueCopy<$R, $Out> on ObjectCopyWith<$R, Car, $Out> {
  CarCopyWith<$R, Car, $Out> get $asCar =>
      $base.as((v, t, t2) => _CarCopyWithImpl(v, t, t2));
}

abstract class CarCopyWith<$R, $In extends Car, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id, String? name, int? year, String? colour, int? manufacturer_id});
  CarCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CarCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Car, $Out>
    implements CarCopyWith<$R, Car, $Out> {
  _CarCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Car> $mapper = CarMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          String? name,
          int? year,
          Object? colour = $none,
          Object? manufacturer_id = $none}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (name != null) #name: name,
        if (year != null) #year: year,
        if (colour != $none) #colour: colour,
        if (manufacturer_id != $none) #manufacturer_id: manufacturer_id
      }));
  @override
  Car $make(CopyWithData data) => Car(
      id: data.get(#id, or: $value.id),
      name: data.get(#name, or: $value.name),
      year: data.get(#year, or: $value.year),
      colour: data.get(#colour, or: $value.colour),
      manufacturer_id: data.get(#manufacturer_id, or: $value.manufacturer_id));

  @override
  CarCopyWith<$R2, Car, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CarCopyWithImpl($value, $cast, t);
}
