import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iatec_authentication_core/src/domain/repositories/logout_repository.dart';
import 'package:iatec_authentication_core/src/domain/usecases/logout.dart';
import 'package:mockito/mockito.dart';

class LogoutRepositoryMock extends Mock implements LogoutRepository {}

void main() {
  LogoutRepository repository;
  Logout usecase;
  setUpAll(() {
    repository = LogoutRepositoryMock();
    usecase = LogoutImpl(repository: repository);
  });

  test('should do login with google provider', () async {
    when(repository.logout()).thenAnswer((_) async => const Right(unit));
    final result = await usecase();
    verify(repository.logout()).called(1);

    expect(result | null, unit);
  });
}
