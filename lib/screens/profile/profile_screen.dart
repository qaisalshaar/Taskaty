import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskatykais/core/hellpers/extensions.dart';
import 'package:taskatykais/core/utilities/app_color.dart';
import 'package:taskatykais/screens/home/home_screen.dart';

import '../../core/widget/custom_btn.dart';
import '../addtask/widget/custom_text_form.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  final textprofileController = TextEditingController();
  String profileText = 'Kais Abdul Basit Mustafa Alshaar';
  final FocusNode _focusNode = FocusNode(); // Add FocusNode
  var formKey = GlobalKey<FormState>();

  UploadFromCamera() async {
    imageFile = await picker.pickImage(source: ImageSource.camera);
  }

  UploadFromGallery() async {
    imageFile = await picker.pickImage(source: ImageSource.gallery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            context.push(HomeScreen());
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.wb_sunny_outlined, color: Colors.blue),
            onPressed: () {
              // Toggle light/dark mode
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: AppColor.mainColor,
                            width: 5.0), // Changed width to 10.0
                      ),
                      context: context,
                      builder: (context) => Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              children: [
                                CustomBtn(
                                  onTap: () async {
                                    // open camera
                                    // imageFile = await picker.pickImage(
                                    //     source: ImageSource.camera);
                                    await UploadFromCamera();
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  title: 'Upload Image From Camera',
                                  color: Colors.red,
                                  // width: 300,
                                  // height: 50,
                                  fontSize: 15,
                                  icon: Icons.camera_alt_rounded,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                CustomBtn(
                                  onTap: () async {
                                    // open camera
                                    // imageFile = await picker.pickImage(
                                    //     source: ImageSource.camera);
                                    await UploadFromGallery();
                                    Navigator.pop(context);
                                    setState(() {});
                                  },
                                  title: 'Upload Image From Galary',

                                  // width: 300,
                                  // height: 50,
                                  fontSize: 15,
                                  icon: Icons.photo_library,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          border:
                          Border.all(color: AppColor.mainColor, width: 3.0),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            //  image: Image.asset('assets/images/kaisalshaar.jpg')
                            image: imageFile != null
                                ? Image.file(File(imageFile!.path)).image
                                : Image.asset('assets/images/kaisalshaar.jpg')
                                .image,
                          ),
                        ),
                      ),
                      Icon(Icons.camera_alt, size: 20, color: Colors.blue),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              color: Colors.grey[300],
              thickness: 2,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    // Wrap the Text widget
                    child: Text(
                      profileText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow:
                      TextOverflow.ellipsis, // Add ellipsis if it overflows
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 3.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.edit, size: 20, color: Colors.blue),
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: AppColor.mainColor,
                                    width: 5.0), // Changed width to 10.0
                              ),
                              context: context,
                              builder: (context) => Wrap(children: [
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Form(
                                      key: formKey,
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      child: Column(
                                        children: [
                                          CustomTextForm(
                                              title: 'Edit Profile Name',
                                              readOnly: false,
                                              hintText:
                                              'Please enter your name',
                                              prefixIcon: Icon(
                                                Icons.text_fields,
                                                color: Colors.grey,
                                              ),
                                              controller:
                                              textprofileController,
                                              validator: (value) {
                                                if (value == null || value.trim().isEmpty) {
                                                  return 'Please enter a valid name';
                                                }
                                                return null; // Return null if the validation is successful
                                              },
                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          CustomBtn(
                                            // width: 300,
                                            //  height: 70,
                                            // onTap: () {
                                            //   profileText='';
                                            //   setState(() {
                                            //
                                            //     profileText =
                                            //         textprofileController
                                            //             .text;
                                            //     Navigator.pop(context);
                                            //
                                            //   });
                                            // },

                                            onTap: () {
                                              profileText='';
                                              if (formKey.currentState!.validate()) {
                                                setState(() {
                                                  profileText = textprofileController.text;
                                                });
                                                Navigator.pop(context);
                                              } else {
                                                _focusNode.requestFocus(); // Request focus
                                              }
                                            },
                                            fontSize: 12,
                                            FontWeightbold: true,
                                            title: 'Edit Profile Name',
                                          ),
                                        ],
                                      ),
                                    )),
                              ]));

                          // Edit profile name
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
