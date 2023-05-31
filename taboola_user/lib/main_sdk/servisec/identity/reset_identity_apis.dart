

import 'package:taboola_user/main_sdk/models/message_model.dart';
import '/main_sdk/models/reset_model.dart';
import '/main_sdk/enum/http_enum.dart';
import '/main_sdk/models/common/result_class.dart';
import 'api_identity.dart';


class ResetIdentityApi extends ApiModelIdentity {
  Future<ResponseState<MessageSendEmail>> sendEmailForResetPassword(EmailModel emailModel) async {
   // TaboolaUserSDK.agent ??= await FlutterUserAgent.getPropertyAsync('userAgent');
    return apiMethod('/reset_password/',
     //   headers: {'userAgent': TaboolaUserSDK.agent},
        data: emailModel.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => MessageSendEmail.fromJson(json));
  }
  Future<ResponseState<MessageSendCode>> checkCodeForResetPassword(CheckCodeModel checkCodeModel) async {
   // TaboolaUserSDK.agent ??= await FlutterUserAgent.getPropertyAsync('userAgent');
    return apiMethod('/check_code/',
     //   headers: {'userAgent': TaboolaUserSDK.agent},
       data: checkCodeModel.toJson(),
        httpEnum: HttpEnum.POST,
        parseJson: (json) => MessageSendCode.fromJson(json));
  }

  Future<ResponseState<Message>> newPasswordForResetPassword(ResetPasswordModel resetPasswordModel) async {
   // TaboolaUserSDK.agent ??= await FlutterUserAgent.getPropertyAsync('userAgent');
    return apiMethod('/reset_password/',
        headers: {'requirestoken': "true"},
        data: resetPasswordModel.toJson(),
        httpEnum: HttpEnum.PUT,
        parseJson: (json) => Message.fromJson(json));
  }




}
