import 'repositories/ninja_repository.dart';
import 'services/fake_ninja_api_service.dart';

Future<void> main() async {
  // Example with mock API Call

  ninjaApiRepository.getNinja();

  while (ninjaApiRepository.isBusy) {
    await Future.delayed(const Duration(milliseconds: 250));

    print('doing other work on main isloate while waiting for asynchronous events...');
  }

  print(ninjaApiRepository.ninjas);

  ninjaApiRepository.getNinjas();

  while (ninjaApiRepository.isBusy) {
    await Future.delayed(const Duration(milliseconds: 250));

    print('doing other work on main isloate while waiting for asynchronous events...');
  }

  print(ninjaApiRepository.ninjas);

  fakeNinjaApiService.closeClient();
}
