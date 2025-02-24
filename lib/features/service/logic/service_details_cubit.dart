import 'package:flutter_bloc/flutter_bloc.dart';

import 'service_details_state.dart';

class ServiceDetailsCubit extends Cubit<ServiceDetailsState> {
  ServiceDetailsCubit() : super(const ServiceDetailsState.initial());
  //
  // List<ServiceDetailModel> ?serviceDetails;
  // fetchAllServiceDetail() {
  //   var serviceDetailBox = Hive.box<ServiceDetailModel>(kServiceDetailsBox);
  //   serviceDetails = serviceDetailBox.values.toList();
  //   emit(const ServiceDetailsState.success());
  // }
}
