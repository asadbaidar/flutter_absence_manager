import 'package:common/common.dart';
import 'package:core/common/paging_entity.dart';
import 'package:core/feature/absence/data/data.dart';
import 'package:core/feature/absence/domain/domain.dart';

class AbsenceRemoteDataSourceImpl implements AbsenceRemoteDataSource {
  AbsenceRemoteDataSourceImpl({required this.httpClient});

  final HttpClient httpClient;

  @override
  Future<PagingEntity<AbsenceEntity, Absence>> getAbsences() {
    return httpClient
        .post<JsonObject>(
          path: AbsenceEndpoints.absences,
        )
        .then(
          (json) => PagingEntity<AbsenceEntity, Absence>.fromJson(
            json,
            (e) => AbsenceEntity.fromJson(e! as JsonObject),
          ),
        );
  }
}
