import 'package:cloud_firestore/cloud_firestore.dart';

final firestoreTestCompany =
    FirebaseFirestore.instance.collection('Customers').doc('TEST_COMPANY');
