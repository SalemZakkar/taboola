
import 'package:tabola_capten/main_sdk/enum/http_enum.dart';
import 'package:tabola_capten/main_sdk/models/about_model.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'api_identity.dart';

class AboutIdentityApi extends ApiModelIdentity {
  Future<ResponseState<About>> getAboutInfo() async {
   return apiMethod('/about_view',
        httpEnum: HttpEnum.GET,
        parseJson: (json) => About.fromJson(json));
  }



}
