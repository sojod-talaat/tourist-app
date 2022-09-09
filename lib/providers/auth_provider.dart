import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:string_validator/string_validator.dart';
import 'package:weather_project/firabase/firestore.dart';
import 'package:weather_project/models/user_model.dart';
import 'package:weather_project/utils/Approuat.dart';

import '../firabase/Authhelper.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    getCurrentuser();
  }
  GlobalKey<FormState> signupkey = GlobalKey();
  GlobalKey<FormState> loginkey = GlobalKey();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobilNumber = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController loginemailController = TextEditingController();
  TextEditingController loginpasswordController = TextEditingController();
  late usermodel currentuser;
  getCurrentuser() async {
    currentuser = await FireStoreHelper.fireStoreHelper.getUserFromFireStore();
  }

  String? requiredValidator(String v) {
    if (v.length < 3) {
      return 'name must contain at least 3 letters';
    }
    return null;
  }

  String? emailValidator(String v) {
    if (!isEmail(v)) {
      return 'invalid email syntax';
    }
    return null;
  }

  String? phoneValidation(String v) {
    if (v.length < 9 || v.length > 10) {
      return 'phone number must contain either 9 or 10 numbers';
    }
  }

  // ignore: non_constant_identifier_names
  Signup() async {
    UserCredential? usercreditanl = await AuthFirebaseHelper.authhelper
        .SignUp(emailController.text, passwordController.text);
    usermodel user = usermodel(
        id: usercreditanl!.user!.uid,
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: mobilNumber.text);
    FireStoreHelper.fireStoreHelper.addUserToFireStore(user);
  }

  // ignore: non_constant_identifier_names
  Login(BuildContext context) async {
    // ignore: unused_local_variable
    UserCredential? user = await AuthFirebaseHelper.authhelper
        .signin(loginemailController.text, loginpasswordController.text);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRouat.home);
    // usermodel currentuse2r=await FireStoreHelper.fireStoreHelper.getUserFromFireStore(currentuser!.user!.uid);
  }

  // ignore: non_constant_identifier_names
  String? NotNullValeditor(String value) {
    if (value.isEmpty || value.length == 0) {
      return "This feild required";
    }
    return null;
  }
}
