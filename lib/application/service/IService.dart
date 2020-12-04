import 'package:moviedb_flutter/application/service/ServiceImplementation.dart';

import 'ServiceApi.dart';

class IService extends ServiceImplementation<ServiceApi>{

  @override
  ServiceApi serviceInterface() => ServiceApi();
}