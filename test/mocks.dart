import 'package:common/common.dart';
import 'package:core/feature/absence/absence.dart';
import 'package:core/feature/employee/employee.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements HttpClient {}

class MockAbsenceRemoteDataSource extends Mock
    implements AbsenceRemoteDataSource {}

class MockAbsenceRepository extends Mock implements AbsenceRepository {}

class MockEmployeeRemoteDataSource extends Mock
    implements EmployeeRemoteDataSource {}

class MockEmployeeRepository extends Mock implements EmployeeRepository {}
