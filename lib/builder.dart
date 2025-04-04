import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'generators/super_model_generator.dart';

Builder superModelBuilder(BuilderOptions options) => SharedPartBuilder(
      [SuperModelGenerator()],
      'super_model',
    );

Builder belongsToBuilder(BuilderOptions options) => SharedPartBuilder(
      [BelongsToGenerator()],
      'belongs_to',
    );
