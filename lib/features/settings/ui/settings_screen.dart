import 'package:flutter/material.dart';
import 'package:trade_craft/core/helpers/spacing.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class MenuItem {
  final String id;
  final String title;
  final IconData icon;

  MenuItem({required this.id, required this.title, required this.icon});
}

class _SettingsScreenState extends State<SettingsScreen> {
  final List<MenuItem> _menuItems = [
    MenuItem(id: 'account', title: 'الحساب', icon: Icons.person_outline),
    MenuItem(
      id: 'notifications',
      title: 'الاشعارات',
      icon: Icons.notifications_none,
    ),
    // MenuItem(id: 'appearance', title: 'Appearance', icon: Icons.visibility_outlined),
    MenuItem(
      id: 'privacy',
      title: 'الخصوصيه والأمان',
      icon: Icons.lock_outline,
    ),
    MenuItem(
      id: 'help',
      title: 'المساعده والدعم',
      icon: Icons.headset_outlined,
    ),
    MenuItem(id: 'about', title: 'حول', icon: Icons.info_outline),
  ];

  List<MenuItem> _filteredItems = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredItems = _menuItems;
    _searchController.addListener(_filterSettings);
  }

  void _filterSettings() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredItems =
          _menuItems
              .where((item) => item.title.toLowerCase().contains(query))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Card(
            color: const Color(0xFF45404a),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/logo2.png', height: 40),

                      const Spacer(),
                      const Text(
                        'الاعدادات',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      // IconButton(
                      //   icon: const Icon(
                      //     Icons.arrow_forward_ios,
                      //     size: 24,
                      //   ),
                      //   color: Colors.white,
                      //   onPressed: () {
                      //     Navigator.pushNamed(
                      //       context,
                      //       Routes.craftMyOrderScreen,
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  verticalSpacing(30),
                  Expanded(child: _buildMenuList()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget _buildSearchBar() {
  //   return Container(
  //     margin: EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //          color: Colors.black,
  //          blurRadius: 4,
  //          offset: Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildMenuList() {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
      itemCount: _filteredItems.length,
      separatorBuilder: (context, index) => SizedBox(height: 10),
      itemBuilder: (context, index) {
        final item = _filteredItems[index];
        return _buildMenuItem(item);
      },
    );
  }

  Widget _buildMenuItem(MenuItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        leading: Icon(item.icon, color: Color(0xFF333333)),
        title: Text(
          item.title,
          style: TextStyle(fontSize: 16, color: Color(0xFF333333)),
        ),
        trailing: Icon(Icons.chevron_right, color: Color(0xFF999999)),
        onTap: () => _navigateToDetail(item.id),
      ),
    );
  }

  void _navigateToDetail(String id) {
    // Implement your navigation logic here
    print('Navigating to $id');
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
