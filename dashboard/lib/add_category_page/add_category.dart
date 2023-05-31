import 'dart:io';
import 'dart:typed_data';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_theme/pressistance/theme_preferences_helper.dart';
import 'package:taboola/module_theme/service/theme_service/theme_service.dart';
import 'package:taboola/utils/helpers/custom_flushbar.dart';
import 'package:taboola/utils/helpers/validators.dart';
import 'package:taboola/utils/images/images.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);

  @override
  _AddCategoryState createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  Image? x;
  TextEditingController catAr = TextEditingController();
  TextEditingController catEn = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          constraints: const BoxConstraints.expand(),
        ),
        Image.asset(ImageAsset.BACKGROUND_IMAGE , width: MediaQuery.of(context).size.width,height: MediaQuery.of(context).size.height,fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: Image.asset(ImageAsset.LOGO , width: 100,),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                     var res = await ImagePicker.platform.getImage(source: ImageSource.gallery);
                     if(res!=null){
                       x = Image.memory((await res.readAsBytes()) , fit: BoxFit.cover,);
                     }
                         setState(() {
                     });
                    },
                    child: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        //color: AppColors.kPrimaryGreenColor,
                        shape: BoxShape.circle
                      ),
                      child: x == null ? Icon(Icons.add_a_photo , size: 50,) :
                      ClipRRect(
                        borderRadius: BorderRadius.circular(120),
                        child: x,
                      )
                      ,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.19,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextField(
                      controller: catEn,
                      decoration: InputDecoration(
                        hintText: S.of(context).categoryName,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor
                          )
                        ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.kPrimaryGrayColor
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.8,
                    child: TextField(
                      controller: catAr,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                          //labelText: "إسم الصنف",
                          hintText: "إسم الصنف",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor
                              )
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.kPrimaryGrayColor
                              )
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 45,
                    child: InkWell(
                      onTap: (){
                          if(Validations.checkCategoryAr(catAr.text) && Validations.checkCategoryEn(catEn.text)){
                           //Todo : Add Category
                          }else{
                            CustomFlushBarHelper.createError(title: S.of(context).error
                            ,message: S.of(context).categoryName
                            ).show(context);
                          }

                      },
                      child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                        alignment: Alignment.center,
                        child: Text(S.of(context).addNewCategory , style: TextStyle(
                          color: AppColors.kPrimaryBodyColor
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
