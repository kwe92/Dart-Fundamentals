import 'repositories/fake_ninja_repository.dart';
import 'services/fake_ninja_api_service.dart';

Future<void> main() async {
  // Example with mock API Call

  fakeNinjaApiRepository.getNinja();

  while (fakeNinjaApiRepository.isBusy) {
    await Future.delayed(const Duration(milliseconds: 250));

    print('doing other work on main isloate while waiting for asynchronous events...');
  }

  print(fakeNinjaApiRepository.ninjas);

  fakeNinjaApiRepository.getNinjas();

  while (fakeNinjaApiRepository.isBusy) {
    await Future.delayed(const Duration(milliseconds: 250));

    print('doing other work on main isloate while waiting for asynchronous events...');
  }

  print(fakeNinjaApiRepository.ninjas);

  fakeNinjaApiService.closeClient();
}
