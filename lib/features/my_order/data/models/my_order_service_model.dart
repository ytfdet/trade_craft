class MyOrderServiceModel {
  final String address;
  final String date;
  final String formDesc;
  final String time;


  MyOrderServiceModel(this.address, this.date, this.formDesc, this.time);

  factory MyOrderServiceModel.fromJson( jsonData) {
    return MyOrderServiceModel(
      jsonData['address'],
      jsonData['date'],
      jsonData['form_desc'],
      jsonData['time'],
    );
  }
}
