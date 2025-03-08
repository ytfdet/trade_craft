

import 'package:cloud_firestore/cloud_firestore.dart';

class MyOrderServiceModel {
  final String id; // Document ID

  final String address;
  final String date;
  final String formDesc;
  final String time;
  final String name;
  final String phone;
   bool isAccept;
   bool isReject;


  MyOrderServiceModel(this.id,this.address, this.date, this.formDesc, this.time, this.name, this.phone, this.isAccept,this.isReject);

  // factory MyOrderServiceModel.fromJson( jsonData) {
  //   return MyOrderServiceModel(
  //     jsonData['address'],
  //     jsonData['date'],
  //     jsonData['form_desc'],
  //     jsonData['time'],
  //     jsonData['name'],
  //     jsonData['phone'],
  //     jsonData['isAccept'],
  //
  //   );
  // }

  factory MyOrderServiceModel.fromFireStore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MyOrderServiceModel(
      doc.id, // Get the document ID
      data['address'],
      data['date'],
       data['form_desc'],
        data['time'],
        data['name'],
         data['phone'],
        data['isAccept'],
      data['isReject'],
    );
  }

}
