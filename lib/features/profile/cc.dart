import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:trade_craft/features/profile/xx.dart';

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://localhost:7029/api/Item'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}