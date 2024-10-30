import '../../shared/models/ninja.dart';
import '../services/fake_ninja_api_service.dart';

NinjaApiRepository get ninjaApiRepository => NinjaApiRepository.instance;

class NinjaApiRepository {
  static final instance = NinjaApiRepository._();

  var _isBusy = false;

  bool get isBusy => _isBusy;

  void setBusy(bool isBusy) {
    _isBusy = isBusy;

    // typically would notify some listeners after setting state at this point
  }

  NinjaApiRepository._();

  List<Ninja> _ninjas = [];

  List<Ninja> get ninjas => _ninjas;

  Future<void> getNinja() async {
    setBusy(true);

    final futureNinja = fakeNinjaApiService.fetchNinja();

    futureNinja.whenComplete(() {
      setBusy(false);
    });

    final data = await futureNinja;

    _ninjas.add(Ninja.fromJson(data));
  }

  Future<void> getNinjas() async {
    setBusy(true);

    final futureNinjas = fakeNinjaApiService.fetchNinjas();

    futureNinjas.whenComplete(() {
      setBusy(false);
    });

    final data = await futureNinjas;

    _ninjas.addAll([for (var json in data) Ninja.fromJson(json)]);

    _ninjas = _ninjas.toSet().toList();
  }
}
