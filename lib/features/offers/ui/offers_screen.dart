import 'package:flutter/material.dart';
import 'package:trade_craft/core/routing/routes.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: (){
        Navigator.pushNamed(context, Routes.craftPersonalProfileScreen);
      }, child: Text("dasadsda")),
    );
  }
}
