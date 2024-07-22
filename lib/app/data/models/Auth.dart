import 'dart:convert';

class Auth {
  String status;
  String body;

  Auth({
    required this.status,
    required this.body,
  });

  // Factory constructor to create an Auth instance from a JSON map
  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      status: json['status'],
      body: json['body'],
    );
  }

  // Method to convert an Auth instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'body': body,
    };
  }
}