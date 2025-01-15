library super_model;

import 'dart:async';
import 'dart:convert';
import 'package:macros/macros.dart';

// somehow macros can't be made part of the library
export 'macros/SuperModelId.dart';
export 'macros/SuperModel.dart';

part 'SuperModelBase.dart';
part 'PropertyMeta.dart';
part 'MacroMemberMeta.dart';
part 'ModelClassMeta.dart';
part 'ISuperModel.dart';
