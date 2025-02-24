import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_service_details_state.dart';

class AddServiceDetailsCubit extends Cubit<AddServiceDetailsState> {
  AddServiceDetailsCubit() : super(const AddServiceDetailsState.initial());

  // addServiceDetails(ServiceDetailModel serviceDetailModel) async{
  //   emit(const AddServiceDetailsState.loading());
  //   try {
  //     var serviceDetailBox=Hive.box<ServiceDetailModel>(kServiceDetailsBox);
  //     await serviceDetailBox.add(serviceDetailModel);
  //     emit(const AddServiceDetailsState.success());
  //   } catch (e) {
  //     emit(AddServiceDetailsState.error(error: e.toString()));
  //   }
  // }
}
