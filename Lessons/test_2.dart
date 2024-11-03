abstract class ApiServiceInterface {
  Future<void> fetchStuff();
}

class ApiService extends ApiServiceInterface {
  Future<void> fetchStuff() async {
    print('i fetch real data');
  }
}

class MockApiService extends ApiServiceInterface {
  /// I am used in tests

  Future<void> fetchStuff() async {
    print('i fetch fake data');
  }
}

class ApiRepository {
  final ApiServiceInterface apiService;

  ApiRepository({required this.apiService});

  Future<void> getData() async {
    // fetch data
    await apiService.fetchStuff();
    // clean data
  }
}

void main() {
  final mockApiService = MockApiService();

  final apiService = ApiService();

  final apiRepository = ApiRepository(apiService: mockApiService);
}

class ORM1 extends ORMInterface {}

class ORM2 extends ORMInterface {}

class ORMInterface {}
