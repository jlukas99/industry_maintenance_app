import 'package:industry_maintenance_app/core/constants/constants.dart';
import 'package:industry_maintenance_app/features/department_page/domain/entities/department.dart';

abstract class DepartmentDataSource {
  const DepartmentDataSource();

  Future<void> addDepartment({
    required String departmentName,
    required String zoneName,
    required String departmentPhoto,
    required String departmentID,
  });

  Future<void> deleteDepartment({
    required String departmentID,
  });

  Stream<List<Department>> fetchDepartments({
    required String zoneName,
  });

  Stream<List<Department>> findDepartment({
    required String departmentName,
  });
}

class DepartmentDataSourceImp implements DepartmentDataSource {
  @override
  Future<void> addDepartment({
    required String departmentName,
    required String zoneName,
    required String departmentPhoto,
    required String departmentID,
  }) async {
    final department = await firestoreTestCompany.collection('departments').add(
          Department(
            departmentName: departmentName,
            zoneName: zoneName,
            departmentPhoto: departmentPhoto,
            departmentID: departmentID,
          ).toJson(),
        );
    final depID = department.id;
    await firestoreTestCompany
        .collection('departments')
        .doc(depID)
        .update({'departmentID': depID});
    // TODO: implement addDepartment
    // throw UnimplementedError();
  }

  @override
  Future<void> deleteDepartment({required String departmentID}) async {
    await firestoreTestCompany
        .collection('departments')
        .doc(departmentID)
        .delete();
    // TODO: implement deleteDepartment
    // throw UnimplementedError();
  }

  @override
  Stream<List<Department>> fetchDepartments({required String zoneName}) async* {
    yield* firestoreTestCompany
        .collection('departments')
        .where('zoneName', isEqualTo: zoneName)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Department.fromJson(doc.data()))
              .toList(),
        );
    // TODO: implement fetchDepartments
    // throw UnimplementedError();
  }

  @override
  Stream<List<Department>> findDepartment({
    required String departmentName,
  }) async* {
    yield* firestoreTestCompany
        .collection('departments')
        .where('departmentName', isGreaterThanOrEqualTo: departmentName)
        .where('departmentName', isLessThanOrEqualTo: '${departmentName}zz')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Department.fromJson(doc.data()))
              .toList(),
        );
    // TODO: implement findDepartment
    // throw UnimplementedError();
  }
}
