import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:purchase_paywall/ui/paywall_factory.dart';
import 'package:purchase_paywall/ui/paywall_factory_impl.dart';

class DependencyManager {
  final _injector = Injector();
  get injector => _injector;

  static final DependencyManager _singleton = DependencyManager._();
  factory DependencyManager() {
    return _singleton;
  }
  DependencyManager._() {
    _initialize();
  }

  void _initialize() {
    injector.map<PayWallFactory>(
      (i) => PayWallFactoryImpl(),
      isSingleton: true,
    );
  }
}
