import 'dart:convert';
import 'dart:io';
import 'package:date_field/date_field.dart';
import 'package:elo_esports/models/create_user.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/login.dart';
import 'package:elo_esports/pages/user_pages/user_dashboard.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String id = '/RegisterPage';

  @override
  State<RegisterPage> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {


  String thumbnail = '';
  DateTime? dateOfBirth;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final DioClient dioClient = DioClient();

  @override
  void initState() {
    super.initState();
  }

  Future<String?> pickAndConvertImageToBase64() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;
      
      final imageFile = File(image.path);
      if (await _validateImageDimensions(imageFile)) {
        List<int> imageBytes = await imageFile.readAsBytes();
        String base64Image = base64Encode(imageBytes);
        return base64Image;
      } else {
        throw "Image dimensions do not meet requirements (1280x720).";
      }
    } on PlatformException catch (e) {
      throw 'Failed to pick image: $e';
    }
  }

  Future<bool> _validateImageDimensions(File imageFile) async {
    final decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
    if (decodedImage.width >= 1280 && decodedImage.height >= 720) {
      return true;
    } else {
      return false;
    }
  }

  String addBase64Padding(String base64String) {
    int paddingLength = (4 - base64String.length % 4) % 4;
    return base64String + '=' * paddingLength;
  }

  pickImage() async {
    try {
      thumbnail = await pickAndConvertImageToBase64() ?? '';
      setState(() {
        debugPrint(thumbnail);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Not able to access your images. Please check permissions. ${e.toString()}'),
      ));
    }
  }

  bool validate() {
    return firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        dateOfBirth != null &&
        thumbnail != '';
  }

  createUser() async {
    CreateUser createUser = CreateUser(
      firstname: firstNameController.text, 
      lastname: lastNameController.text, 
      email: emailController.text, 
      username: usernameController.text, 
      phone: phoneNumberController.text, 
      businessInfo: null, 
      address: addressController.text, 
      password: passwordController.text, 
      dateOfBirth: dateOfBirth, 
      agree: 'true', 
      profile: thumbnail
    );

    await dioClient.createUser(context, createUser);

    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //   content: Text('Signed in successfully'),
    // ));

    // if(userDetails != null) {
    //   SharedPreferencesService.setUserDetails(userDetails);
    // }

    Navigator.pushNamed(context, LoginPage.id);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Image(image: AssetImage('assets/images/splash_banner.png')),
                  InputField(label: 'First Name', controller: firstNameController),
                  const SizedBox(height: 10,),
                  InputField(label: 'Last Name', controller: lastNameController),
                  const SizedBox(height: 10,),
                  InputField(label: 'Email', controller: emailController),
                  const SizedBox(height: 10,),
                  InputField(label: 'Username', controller: usernameController),
                  const SizedBox(height: 10,),
                  InputField(label: 'Phone Number', controller: phoneNumberController),
                  const SizedBox(height: 10,),
                  InputField(label: 'Password', controller: passwordController),
                  const SizedBox(height: 10,),
                  InputField(label: 'Address', controller: addressController),
                  const SizedBox(height: 10,),
                  // InputField(label: 'Date Of Birth', controller: dobController),
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      labelText: 'Date Of Birth',
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Color(0xff262657),
                      filled: true,
                      hintStyle: TextStyle(
                        fontSize: 10,
                        color: Colors.white
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    lastDate: DateTime.now().subtract(const Duration(days: 365)),
                    initialPickerDateTime: DateTime.now().subtract(const Duration(days: 365)),
                    mode: DateTimeFieldPickerMode.date,
                    onChanged: (DateTime? value) {
                      dateOfBirth = value;
                    },
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 100,
                        child:  Image.memory(base64Decode(thumbnail)),
                      ),
                      const SizedBox(width: 20,),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: ElevatedButton(
                          style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 205, 37, 15)),
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                    minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                                    padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                                    elevation: MaterialStateProperty.all(20),
                                    overlayColor: MaterialStateProperty.all(Colors.blue.shade900),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      )
                                    )
                                  ),
                          onPressed: () {
                              pickImage();
                          },
                          child: const Text('Profile image'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  ElevatedButton(
                    style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff0F38CD)),
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                              minimumSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                              padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                              elevation: MaterialStateProperty.all(20),
                              overlayColor: MaterialStateProperty.all(Colors.blue.shade900),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                )
                              )
                            ),
                    onPressed: () {
                      if (validate()) {
                        createUser();
                      } else {
                        // Show error message
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error', style: TextStyle(color: Colors.white),),
                              content: const Text('Please fill all fields and select image.', style: TextStyle(color: Colors.white)),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('OK', style: TextStyle(color: Colors.white)),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: const Text('Sign Up'),
                  ) 
                ],
              ),
            )),
      ),
    );
  }
}


class InputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const InputField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.getFont(
            'Open Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            letterSpacing: -0.4,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(
          height: 60,
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.multiline,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              fillColor: Color(0xff262657),
              filled: true,
              hintStyle: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],
    );
  }
}