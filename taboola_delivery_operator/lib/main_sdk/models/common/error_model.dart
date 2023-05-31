import 'dart:convert';

class MessageModel {
  String code;
  String name;
  String message;
  bool isSuccess = false;

  MessageModel({this.code = '000', this.name = 'unKnow', this.message = 'Unknown Error', this.isSuccess = false});

  factory MessageModel.fromJson(String str) => MessageModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessageModel.EmptyMessageSuccess() => MessageModel(isSuccess: true);

  factory MessageModel.fromMap(Map<String, dynamic> json) => MessageModel(
        code: json['code'] ?? '000',
        name: json['name'] ?? 'unKnow',
        message: json['message'] ?? 'Unknown Error',
      );

  Map<String, dynamic> toMap() => {
        'code': code,
        'name': name,
        'message': message,
        'isSuccess': isSuccess,
      };
}
