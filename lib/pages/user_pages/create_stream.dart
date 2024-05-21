import 'dart:convert';
import 'dart:io';
import 'package:elo_esports/models/create_stream_request.dart';
import 'package:elo_esports/models/create_stream_response.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CreateStreamPage extends StatefulWidget {
  const CreateStreamPage({super.key});
  static String id = '/CreateStreamPage';

  @override
  State<CreateStreamPage> createState() => CreateStreamPageState();
}

class CreateStreamPageState extends State<CreateStreamPage> {

  UserDetails? _userDetails;
  CreateStreamResponse? _createStreamResponse;

  String thumbnail = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final DioClient dioClient = DioClient();

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    _userDetails = await SharedPreferencesService.getUserDetails();
    setState(() {});
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
    return nameController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        thumbnail != '';
  }

  createStream() async {
    CreateStreamRequest createStreamRequest = CreateStreamRequest(
        name: nameController.text,
        description: descriptionController.text,
        image: 'data:image/png;base64,$thumbnail');
    _createStreamResponse =
        await dioClient.createStream(context, createStreamRequest);

    setState(() {
      
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Stream created successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xff160E42),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF322B59),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(_userDetails?.data?.user?.imageLink ?? '--'), fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5)
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _userDetails?.data?.user?.username ?? '--',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Stream key :\n${_userDetails?.data?.user?.streamKey ?? '--'}',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  
                  _createStreamResponse == null ? Column(
                    children: [
                      InputField(label: 'Stream name', controller: nameController),
                      const SizedBox(height: 20,),
                      InputField(label: 'Description', controller: descriptionController),
                      const SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 150,
                            child:  Image.memory(base64Decode(thumbnail)),
                          ),
                          const SizedBox(width: 20,),
                          SizedBox(
                            height: 40,
                            width: 120,
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
                              child: const Text('Pick image'),
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
                            createStream();
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
                        child: const Text('Save Details'),
                      ),
                    ],
                  ) : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stream name',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        _createStreamResponse?.stream?.name ?? '--',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        'Description',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        _createStreamResponse?.stream?.description ?? '--',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 20,),
                      Text(
                        'Stream Server',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        'rtmp://64.225.106.160:1945/show',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                       const SizedBox(height: 20,),
                      Text(
                        'Stream Url',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        'https://uat.elo-esports.com/stream/${_createStreamResponse?.stream?.id ?? '--'}',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
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