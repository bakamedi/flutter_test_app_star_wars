import 'package:tuple/tuple.dart';

import '../data/helpers/http_helper_response.dart';

typedef GenericResponse = Tuple2<HttpHelperResponse, dynamic>;

typedef Parser<T> = T Function(dynamic data);
