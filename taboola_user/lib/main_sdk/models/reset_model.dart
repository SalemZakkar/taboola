import 'dart:convert';

class EmailModel {
  String? email;

  EmailModel({
    this.email,
  });

  factory EmailModel.fromJson(String str) =>
      EmailModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EmailModel.fromMap(Map<String, dynamic> json) =>
      EmailModel(
        email: json['email'],
      );

  Map<String, dynamic> toMap() =>
      {
        'email': email,
      };
}

class CheckCodeModel {
  int? codeId;
  int? sentCode;

  CheckCodeModel({
    this.codeId,
    this.sentCode,
  });

  factory CheckCodeModel.fromJson(String str) =>
      CheckCodeModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CheckCodeModel.fromMap(Map<String, dynamic> json) =>
      CheckCodeModel(
        codeId: json['code_id'],
        sentCode: json['sent_code'],
      );

  Map<String, dynamic> toMap() =>
      {
        'code_id': codeId,
        'sent_code': sentCode,
      };
}

class ResetPasswordModel {
  String? newPassword;


  ResetPasswordModel({
    this.newPassword,

  });

  factory ResetPasswordModel.fromJson(String str) =>
      ResetPasswordModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetPasswordModel.fromMap(Map<String, dynamic> json) =>
      ResetPasswordModel(
        newPassword: json['new_password'],

      );

  Map<String, dynamic> toMap() =>
      {
        'new_password': newPassword,

      };
}


class MessageSendEmail {
  String? message;
  int? id;

  MessageSendEmail({this.message , this.id});

  MessageSendEmail.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['id'] = id;
    return data;
  }
}
class MessageSendCode {
  String? message;
  String? token;

  MessageSendCode({this.message , this.token});

  MessageSendCode.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    return data;
  }
}