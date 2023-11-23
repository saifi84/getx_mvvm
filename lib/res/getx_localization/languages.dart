import 'package:get/get_navigation/src/root/internacionalization.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email': "Email",
          'login': "Login",
          "email_hint": "Enter Email",
          "password_hint": "Enter Password",
          "pleaseEnterEmail": "Please Enter Email",
          "pleaseEnterPassword": "Please Enter Password",
        },
        'ur_PK': {'email': "ای میل"},
      };
}
