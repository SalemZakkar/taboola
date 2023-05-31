import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/constants/validations.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/models/token.dart';
import 'package:taboola_user/main_sdk/servisec/identity/token_identity_api.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import '../../../routes.dart';

class EditUserPage extends StatefulWidget {
  final DataUser? dataUser;
  const EditUserPage({Key? key , this.dataUser}) : super(key: key);

  @override
  _EditUserPageState createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController  lastName = TextEditingController();
  File? _image;
  Future<void> getImage() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((value) {
      setState(() {
        if (value != null) {
          _image = File(value.path);
          // LocalStorageService().userImagePath = value.path;
        } else {
          print('No image selected.');
        }
      });
    });
  }
  @override
  void initState() {
    if(widget.dataUser?.firstName!=null){
      firstName.text = widget.dataUser!.firstName!;
    }
    if(widget.dataUser?.lastName!=null){
      lastName.text = widget.dataUser!.lastName!;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            color: Theme.of(context).backgroundColor,
          ),
          Image.asset(
            Assets.backgroundImage,
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                "Edit Profile",
                //style: TextStyle(color: AppColors.kPrimaryGreenColor),
              ),
              centerTitle: true,
            ),
            body: Container(
              color: Colors.transparent,
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints.expand(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () => getImage(),
                      child: Container(
                        height: 115,
                        width: 115,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                              color: AppColors.kPrimaryGreenColor,
                              spreadRadius: 1.5,
                              blurRadius: 1.5,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Center(
                            child: _image == null
                                ? const Icon(
                              Icons.camera,
                              size: 75.0,
                            )
                                : ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                _image!,
                                height: 115,
                                width: 115,
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text("Edit Photo"),
                        onPressed: () {
                          if(_image!=null){
                            TokenIdentityApi().editProfileImage(_image!);
                          }

                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.kPrimaryGreenColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)))),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: firstName,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.kPrimaryGreenColor),
                        ),
                        hintText: "First Name",
                        hintStyle: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: lastName,
                      decoration: InputDecoration(
                        focusedBorder: const UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.kPrimaryGreenColor),
                        ),
                        hintText: "LastName",
                        hintStyle: TextStyle(
                            color: Theme.of(context).textTheme.bodyText1?.color,

                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: size.width * 0.5,
                      height: 50,
                      child: ElevatedButton(
                        child: const Text("Save"),
                        onPressed: () {
                          if (Validations.checkName(firstName.text) &&
                              Validations.checkName(lastName.text)) {
                            showDialog(
                                context: context,
                                // barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AppFutureBuilder<Message>(
                                    future: TokenIdentityApi().editDataUser(
                                        User(
                                            firstName: firstName.text,
                                            lastName: lastName.text)),
                                    whenError: (error) {
                                      return CustomDialogBox(
                                        title: "error",
                                        subTitle: error!.errorMessage.getErrors,
                                        textInButton: "ok",
                                        check: true,
                                        callback: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    },
                                    whenDone: (data) {
                                      return CustomDialogBox(
                                        title: "Congratulation",
                                        subTitle: data.message,
                                        textInButton: "ok",
                                        check: true,
                                        callback: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            Routes.userDetails,
                                          );
                                        },
                                      );
                                    },
                                  );
                                });
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                AppColors.kPrimaryGreenColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
