import 'package:moviedb_flutter/application/service/service_implementation.dart';

import 'service_api.dart';

class IService extends ServiceImplementation<ServiceApi>{

  @override
  ServiceApi serviceInterface() => ServiceApi();
}