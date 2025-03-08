import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:trade_craft/core/routing/routes.dart';
import 'package:trade_craft/core/widgets/custom_button.dart';
import 'package:trade_craft/features/craft_personal_profile/logic/profile_cubit.dart';
import '../../craft_personal_profile/logic/profile_state.dart';
import 'widgets/multi_image_piker.dart';
import 'widgets/problem_description_text_filed.dart';

class ServiceScreen extends StatelessWidget {
   ServiceScreen({super.key,});

  final TextEditingController timeController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

   final TextEditingController formDescController = TextEditingController();
   final TextEditingController addressController = TextEditingController();
  File? selectedImage;
  String? formDescription, address, time, date;


   CollectionReference serviceDetails = FirebaseFirestore.instance.collection('service_details');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (profile) => _buildLoadedState(context, profile.data.first.name,profile.data.first.phone,profile.data.first.gender),
          error: (error) => Center(child: Text('Error: $error')),
        );
      },
    );
  }

   Widget _buildLoadedState(BuildContext context, String name,String phone,String gender) {
     final formKey = GlobalKey<FormState>();
     return Scaffold(
       backgroundColor: Colors.white,
       body: Scaffold(
       body: SafeArea(
         child: Card(
           color: const Color(0xFF45404a),
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(16),
           ),
           child: Padding(
             padding: const EdgeInsets.all(32.0),
             child: SingleChildScrollView(
               child: Form(
                 key: formKey,
                 child: Column(
                   mainAxisSize: MainAxisSize.max,
                   crossAxisAlignment: CrossAxisAlignment.stretch,
                   children: [
                     Text(
                       'صفحة طلب الخدمة',
                       style: TextStyle(
                         fontSize: 24,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                       ),
                       textAlign: TextAlign.center,
                     ),
                     const SizedBox(height: 15.0),
                     MultiImagePickerBox(),
                     const SizedBox(height: 15.0),
                     ProblemDescriptionTextField(
                       controller: formDescController,
                       maxLines: 5,
                       hint: 'تفاصيل المشكلة',
                       suffix: const Icon(Icons.wrap_text_outlined),
                       suffixcolor: Colors.red,
                     ),
                     const SizedBox(height: 15.0),
                     ProblemDescriptionTextField(
                       onSaved: (value) {
                         date = value;
                       },
                       hint: 'تاريخ حدوث المشكله',
                       controller: dateController,
                       ontap: () {
                         showDatePicker(
                           context: context,
                           firstDate: DateTime.now(),
                           lastDate: DateTime.now().add(
                             const Duration(days: 30),
                           ),
                         ).then((value) {
                           dateController.text = DateFormat(
                             'yyyy-MM-dd',
                           ).format(value!).toString();
                         });
                       },
                       suffix: const Icon(Icons.date_range_outlined),
                       suffixcolor: Colors.red,
                     ),
                     const SizedBox(height: 15.0),
                     ProblemDescriptionTextField(
                       onSaved: (value) {
                         time = value;
                       },
                       hint: 'وقت حدوث المشكله',
                       controller: timeController,
                       ontap: () {
                         showTimePicker(
                           context: context,
                           initialTime: TimeOfDay.now(),
                         ).then((value) {
                           timeController.text =
                               value!.format(context).toString();
                         });
                       },
                       suffix: const Icon(Icons.watch_later_outlined),
                       suffixcolor: Colors.red,
                     ),
                     const SizedBox(height: 15.0),
                     ProblemDescriptionTextField(
                       controller: addressController,
                       hint: 'العنوان الى حدث فيه المشكلة',
                       suffix: const Icon(Icons.maps_home_work_outlined),
                       suffixcolor: Colors.red,
                     ),
                     const SizedBox(
                       height: 15.0,
                     ),
                     CustomButton(
                       text: "تأكيد الطلب",
                       onPressed: () {
                         if (formKey.currentState!.validate()) {
                           // formKey.currentState!.save();
                           // var serviceDetailModel = ServiceDetailModel(
                           //     selectedImages: selectedImage!,
                           //     formDescription: formDescription!,
                           //     address: address!,
                           //     time: time!,
                           //     date: date!);
                           // context
                           //     .read<AddServiceDetailsCubit>()
                           //     .addServiceDetails(serviceDetailModel);
                           serviceDetails.add({
                             'time':timeController.text,
                             'form_desc':formDescController.text,
                             'date':dateController.text,
                             'address':addressController.text,
                             'name':name,
                             'phone':phone,
                             'isAccept':false,
                             'isReject':false,

                           }).then((value) => print("User Added"))
                               .catchError((error) => print("Failed to add user: $error"));
                           Navigator.pushNamed(context, gender=='male'?Routes.myOrderScreen:Routes.layoutScreen);
                         }
                       },
                     ),
                   ],
                 ),
               ),
             ),
           ),
         ),
       ),
     ),
     );
   }

}
