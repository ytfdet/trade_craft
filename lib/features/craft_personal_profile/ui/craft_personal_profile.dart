import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_craft/features/craft_personal_profile/logic/profile_cubit.dart';
import 'package:trade_craft/features/craft_personal_profile/ui/widgets/menu_button.dart';

import '../../../core/helpers/constant.dart';
import '../../../core/routing/routes.dart';
import '../logic/profile_state.dart';


class CraftPersonalProfileScreen extends StatelessWidget {
  final String profileImage =
      "https://images.unsplash.com/photo-1633332755192-727a05c4013d?w=400&h=400&fit=crop";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileState>
        (builder: (context, state) {
          return state.when(initial: () => SizedBox.shrink(), loading: () => Center(child: CircularProgressIndicator(
            color: Colors.red,
          )), loaded: (profile) {
            return Column(
              children: [
                // Gradient Background
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF45404a), Color(0xFF45404a)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 40),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu, color: Colors.white),
                              onPressed: () {},
                            ),

                            const Spacer(),
                            const Text(
                              'الملف الشخصي',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Image.asset('assets/images/logo2.png', height: 40),

                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white, width: 4),
                                  image: DecorationImage(
                                    image: NetworkImage(profileImage),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),
                              Text(
                                profile.data.first.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'سباك',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.9),
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 16),
                              // Action Buttons
                              SizedBox(width: 12),
                              SizedBox(height: 16),
                              Text(
                                profile.data.first.phone,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'القاهره -مدرسة السعديه بنين',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.edit_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Menu Items
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        left: 30,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            'Plus',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50, left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MenuButton(
                              icon: Icons.description_outlined,
                              label: 'Background',
                            ),
                            MenuButton(
                              icon: Icons.language_outlined,
                              label: 'English',
                            ),
                            MenuButton(
                              icon: Icons.school_outlined,
                              label: 'Education',
                            ),
                            MenuButton(icon: Icons.work_outline, label: 'Career'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }, error: (error) => SizedBox.shrink(),);
        },),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// import '../../../core/routing/routes.dart';
//
// class CraftPersonalProfileScreen extends StatefulWidget {
//   @override
//   _CraftsmanProfileCardState createState() => _CraftsmanProfileCardState();
// }
//
// class _CraftsmanProfileCardState extends State<CraftPersonalProfileScreen> {
//   File? _profileImage;
//   final ImagePicker _picker = ImagePicker();
//   double _rating = 4.5; // Example rating
//   int _yearsExperience = 15; // Example experience
//
//   Future<void> _changeProfilePhoto() async {
//     try {
//       final XFile? image = await _picker.pickImage(
//         source: ImageSource.gallery,
//         imageQuality: 85,
//       );
//
//       if (image != null && mounted) {
//         setState(() {
//           _profileImage = File(image.path);
//         });
//       }
//     } catch (e) {
//       print('Error picking image: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Card(
//           color: const Color(0xFF45404a),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//
//           margin: const EdgeInsets.all(16),
//           elevation: 5,
//
//           child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Image.asset('assets/images/logo2.png', height: 40),
//
//                     const Spacer(),
//                     const Text(
//                       'تفاصيل الطلب',
//                       style: TextStyle(
//                         fontSize: 24,
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const Spacer(),
//                     IconButton(
//                       icon: const Icon(Icons.arrow_forward_ios, size: 24),
//                       color: Colors.white,
//                       onPressed: () {
//                         Navigator.pushNamed(context, Routes.craftMyOrderScreen);
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 // Profile Photo Section
//                 GestureDetector(
//                   onTap: _changeProfilePhoto,
//                   child: Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundColor: Colors.brown[200],
//                         backgroundImage:
//                             _profileImage != null
//                                 ? FileImage(_profileImage!)
//                                 : const AssetImage(
//                                       'assets/images/49d6efee6ea458253c409d631dba73db.jpg',
//                                     )
//                                     as ImageProvider,
//                         child:
//                             _profileImage == null
//                                 ? const Icon(
//                                   Icons.camera_alt,
//                                   size: 40,
//                                   color: Colors.white,
//                                 )
//                                 : null,
//                       ),
//                       Positioned(
//                         bottom: 0,
//                         right: 0,
//                         child: Container(
//                           padding: const EdgeInsets.all(2),
//                           decoration: BoxDecoration(
//                             color: Colors.red,
//                             shape: BoxShape.circle,
//                           ),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.add_a_photo),
//                             color: Colors.white,
//                             style: IconButton.styleFrom(
//                               backgroundColor: Colors.red,
//                               iconSize: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Craftsman Information
//                 Text(
//                   'محمد أحمد',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//
//                 Text(
//                   'نجار محترف',
//                   style: TextStyle(fontSize: 18, color: Colors.white),
//                 ),
//
//                 const SizedBox(height: 10),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(Icons.location_on, color: Colors.red),
//                     const SizedBox(width: 5),
//                     Text(
//                       'القاهرة، مصر',
//                       style: TextStyle(fontSize: 16, color: Colors.white),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 15),
//
//                 // Rating Stars
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: List.generate(5, (index) {
//                     return Icon(
//                       index < _rating.floor() ? Icons.star : Icons.star_border,
//                       color: Colors.amber,
//                       size: 28,
//                     );
//                   }),
//                 ),
//
//                 const SizedBox(height: 15),
//
//                 // Services Offered
//                 Wrap(
//                   spacing: 10,
//                   children: [
//                     Chip(
//                       label: const Text('أثاث خشبي'),
//                       backgroundColor: Colors.brown[100],
//                     ),
//                     Chip(
//                       label: const Text('أعمال النجارة'),
//                       backgroundColor: Colors.brown[100],
//                     ),
//                     Chip(
//                       label: const Text('تصميم داخلي'),
//                       backgroundColor: Colors.brown[100],
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 20),
//
//                 // Contact Button
//                 ElevatedButton.icon(
//                   icon: const Icon(Icons.phone, color: Colors.white),
//                   label: const Text(
//                     'اتصل الآن',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.red,
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 30,
//                       vertical: 12,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                   ),
//                   onPressed: () {
//                     // Implement phone call functionality
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// import '../../../core/routing/routes.dart';
//
// class CraftPersonalProfileScreen extends StatelessWidget {
//   const CraftPersonalProfileScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: SafeArea(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Card(
//             color: const Color(0xFF45404a),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(32.0),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset(
//                           'assets/images/logo2.png',
//                           height: 40,
//                         ),
//
//                         const Spacer(),
//                         const Text(
//                           'المعلومات الشخصيه',
//                           style: TextStyle(
//                             fontSize: 24,
//                             color: Colors.white,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const Spacer(),
//                         IconButton(
//                           icon: const Icon(
//                             Icons.arrow_forward_ios,
//                             size: 24,
//                           ),
//                           color: Colors.white,
//                           onPressed: () {
//                             Navigator.pushNamed(
//                               context,
//                               Routes.craftMyOrderScreen,
//                             );
//                           },
//                         ),
//                       ],
//                     ),
//                     _buildProfileHeader(),
//                     //_buildWatchVideoButton(),
//                     _buildProfileSections(),
//                     _buildPlusSection(),
//                     _buildTabSection(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildProfileHeader() {
//     return Padding(
//       padding: EdgeInsets.all(20),
//       child: Column(
//         children: [
//           CircleAvatar(
//             radius: 50,
//             backgroundImage: //Image.asset('assets/images/download.jpg'),
//             AssetImage(
//               'assets/images/download.jpg',
//             ), // Add your image
//           ),
//           SizedBox(height: 15),
//           Text(
//             ' هشام أحمد هاشم',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           SizedBox(height: 5),
//           Text(
//             'السباكه',
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Widget _buildWatchVideoButton() {
//   //   return Padding(
//   //     padding: EdgeInsets.symmetric(horizontal: 40),
//   //     child: ElevatedButton.icon(
//   //       icon: Icon(Icons.play_circle_fill),
//   //       label: Text('Watch Video'),
//   //       style: ElevatedButton.styleFrom(
//   //         backgroundColor: Colors.blue,
//   //         padding: EdgeInsets.symmetric(vertical: 15),
//   //         shape: RoundedRectangleBorder(
//   //           borderRadius: BorderRadius.circular(30),
//   //         ),
//   //       ),
//   //       onPressed: () {},
//   //     ),
//   //   );
//   // }
//
//   Widget _buildProfileSections() {
//     return Padding(
//       padding: EdgeInsets.all(20),
//       child: Directionality(
//         textDirection: TextDirection.rtl,
//         child: Column(
//           children: [
//             ListTile(
//               leading: Icon(Icons.school),
//               title: Text('المدرسه السعديه بنين',style: TextStyle(
//                 color: Colors.white)
//               ),
//             ),
//             ListTile(
//               leading: Icon(Icons.location_on),
//               title: Text('القاهره-المعادى',style: TextStyle(
//                 color: Colors.white
//               ),),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildPlusSection() {
//     return Container(
//       margin: EdgeInsets.all(20),
//       padding: EdgeInsets.all(15),
//       decoration: BoxDecoration(
//         color: Colors.grey[200],
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: Row(
//         children: [
//           Icon(Icons.add_circle, color: Colors.blue),
//           SizedBox(width: 10),
//           Text('Plus', style: TextStyle(fontWeight: FontWeight.bold)),
//           Spacer(),
//           Text('Background English', style: TextStyle(color: Colors.grey)),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabSection() {
//     return DefaultTabController(
//       length: 3,
//       child: Column(
//         children: [
//           TabBar(
//             labelColor: Colors.blue,
//             unselectedLabelColor: Colors.white,
//             tabs: [
//               Tab(text: 'التعليقات'),
//               Tab(text: 'المهنه'),
//               Tab(text: 'المهارات ',
//
//               ),
//             ],
//           ),
//           Container(
//             height: 200,
//             child: TabBarView(
//               children: [
//                 _buildEducationContent(),
//                 _buildCareerContent(),
//                 _buildSkillsContent(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildEducationContent() {
//     return ListView(
//       padding: EdgeInsets.all(15),
//       children: [
//         ListTile(
//           title: Text('BSc Computer Science'
//           ,style: TextStyle(
//             color: Colors.white
//           )),
//           subtitle: Text('University of Jordan • 2015-2019',
//           style: TextStyle(
//             color: Colors.white
//           ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildCareerContent() {
//     return ListView(
//       padding: EdgeInsets.all(15),
//       children: [
//         ListTile(
//           title: Text('Automotive Expert'),
//           subtitle: Text('ABC Company • 2019-Present'),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSkillsContent() {
//     return GridView.count(
//       padding: EdgeInsets.all(15),
//       crossAxisCount: 2,
//       children: [
//         Chip(label: Text('Marketing')),
//         Chip(label: Text('Automotive')),
//         Chip(label: Text('Management')),
//         Chip(label: Text('Communication')),
//       ],
//     );;
//   }
// }
