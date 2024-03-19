import 'package:cloud_firestore/cloud_firestore.dart';

Future<QuerySnapshot> ensureNotVendorEmail({required String email}) async {
  QuerySnapshot query = await FirebaseFirestore.instance
      .collection('vendors')
      .where('email', isEqualTo: email)
      .get();
  return query;
}
