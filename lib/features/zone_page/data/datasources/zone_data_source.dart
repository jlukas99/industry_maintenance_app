import 'package:industry_maintenance_app/core/constants/constants.dart';
import 'package:industry_maintenance_app/features/zone_page/domain/entities/zone.dart';

abstract class ZoneDataSource {
  const ZoneDataSource();

  Future<void> createZone({
    required String zoneName,
    required String zoneID,
    String? zonePicture,
  });

  Future<void> deleteZone({
    required String zoneID,
  });

  Future<bool> zoneExists({
    required String zoneName,
  });

  Stream<List<FactoryZone>> fetchZones();

  Stream<List<FactoryZone>> findZone({
    required String zoneName,
  });
}

class ZoneDataSourceImp implements ZoneDataSource {
  @override
  Future<void> createZone({
    required String zoneName,
    required String zoneID,
    String? zonePicture,
  }) async {
    final zone = await firestoreTestCompany.collection('zones').add(
          FactoryZone(zoneName: zoneName, zoneID: zoneID, zonePicture: '')
              .toJson(),
        );
    final zoneDocID = zone.id;
    await firestoreTestCompany
        .collection('zones')
        .doc(zoneDocID)
        .update({'zoneID': zoneDocID});
  }

  @override
  Future<void> deleteZone({required String zoneID}) async {
    await firestoreTestCompany.collection('zones').doc(zoneID).delete();
  }

  @override
  Future<bool> zoneExists({required String zoneName}) async {
    final result = await firestoreTestCompany
        .collection('zones')
        .where('zoneName', isEqualTo: zoneName)
        .get();
    if (result.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Stream<List<FactoryZone>> fetchZones() async* {
    yield* firestoreTestCompany.collection('zones').snapshots().map((snapshot) {
      return snapshot.docs
          .map((doc) => FactoryZone.fromJson(doc.data()))
          .toList();
    });
  }

  @override
  Stream<List<FactoryZone>> findZone({required String zoneName}) async* {
    yield* firestoreTestCompany
        .collection('zones')
        .where('zoneName', isGreaterThanOrEqualTo: zoneName)
        .where('zoneName', isLessThanOrEqualTo: '${zoneName}zz')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => FactoryZone.fromJson(doc.data()))
          .toList();
    });
  }
}
