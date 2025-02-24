import 'package:flutter/material.dart';
import 'package:trade_craft/core/helpers/extention.dart';
import 'package:trade_craft/core/routing/routes.dart';
import 'package:trade_craft/features/home/ui/widgets/service.dart';

class ServicesGrid extends StatelessWidget {
  const ServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'اختيار الخدمة',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            padding: const EdgeInsets.all(16.0),
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children:
                Service.all
                    .map(
                      (service) => ServiceCard(service: service),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.serviceScreen,
          arguments: service.name,
        );
      } ,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,

                border: Border.all(color: Color(0xFF3B5998), width: 2),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    service.iconPath,
                    color: const Color(0xFF3B5998),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            service.name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
