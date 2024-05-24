import 'dart:convert';
import 'dart:io';

import 'package:elo_esports/models/create_betting_master.dart';
import 'package:elo_esports/models/create_betting_view_master.dart';
import 'package:elo_esports/models/create_tutorial.dart';
import 'package:elo_esports/models/tutorial.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/admin_widgets/common_btn.dart';
import 'package:elo_esports/pages/admin_widgets/common_text_filed.dart';
import 'package:elo_esports/pages/admin_widgets/title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/update_tutorial.dart';

class AdminAddTutorialPage extends StatefulWidget {
  AdminAddTutorialPage({super.key, this.updateTutorial});

  Datum? updateTutorial;
  @override
  State<StatefulWidget> createState() => _AdminAddTutorialState();
}

class _AdminAddTutorialState extends State<AdminAddTutorialPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.updateTutorial != null) {
      _type = widget.updateTutorial!.type ?? '';
      _name.text = widget.updateTutorial!.name ?? '';
      _description.text = widget.updateTutorial!.description ?? '';
      _tutorial_url.text = widget.updateTutorial!.tutorialUrl ?? '';
      _document_attachment = widget.updateTutorial!.documentAttachment ?? '';
    }
  }

  final DioClient dioClient = DioClient();

  List<String> list = <String>['Document', 'Video'];
  String _type = '';
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _tutorial_url = TextEditingController();
  String _document_attachment = '';

  pickImage() async {
    try {
      _document_attachment = await pickAndConvertImageToBase64() ?? '';
      setState(() {
        debugPrint(_document_attachment);
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Not able to access your images. Please check permissions. ${e.toString()}'),
      ));
    }
  }

  Future<String?> pickAndConvertImageToBase64() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return null;

      final imageFile = File(image.path);
      // if (await _validateImageDimensions(imageFile)) {
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);
      return base64Image;
      // } else {
      //   throw "Image dimensions do not meet requirements (1280x720).";
      // }
    } on PlatformException catch (e) {
      throw 'Failed to pick image: $e';
    }
  }

  bool validate() {
    return _type.isNotEmpty &&
        _name.text.isNotEmpty &&
        _description.text.isNotEmpty;
  }

  CreateNewTutorial() async {
    CreateTutorial createTutorial = CreateTutorial(
      type: _type,
      name: _name.text,
      description: _description.text,
      tutorialUrl: _tutorial_url.text,
      documentAttachment: _document_attachment,
    );
    await dioClient.createTutorial(context, createTutorial);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Tutorial details add successfully'),
    ));
  }

  updateTutorial() async {
    UpdateTutorial updateTutorial = UpdateTutorial(
      id: widget.updateTutorial?.id.toString(),
      type: _type,
      name: _name.text,
      description: _description.text,
      tutorialUrl: _tutorial_url.text,
      documentAttachment: _document_attachment,
    );
    await dioClient.updateTutorial(context, updateTutorial);

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Tutorial details updated successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF160E42),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                'Manage Tutorials',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Container(
              width: 500,
              decoration: const BoxDecoration(
                  color: Color(0xFF322B59),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create Tutorial',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'Name *'),
                    Container(
                      height: 5,
                    ),
                    DropdownMenu<String>(
                      textStyle: TextStyle(color: Colors.white),
                      initialSelection: '',
                      onSelected: (String? value) {
                        setState(() {
                          _type = value!;
                        });
                      },
                      dropdownMenuEntries:
                          list.map<DropdownMenuEntry<String>>((String value) {
                        return DropdownMenuEntry<String>(
                          value: _type,
                          label: value,
                        );
                      }).toList(),
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'Name *'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _name,
                      hintText: 'Enter Name',
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'Description *'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _description,
                      hintText: 'Enter Description',
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'YouTube URL'),
                    Container(
                      height: 5,
                    ),
                    CommonTextFiled(
                      controller: _tutorial_url,
                      hintText: 'Enter YouTube URL',
                    ),
                    Container(
                      height: 10,
                    ),
                    TitleText(printtext: 'Document Attachment'),
                    Container(
                      height: 5,
                    ),
                    SizedBox(
                      height: 40,
                      width: 150,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color.fromARGB(255, 205, 37, 15)),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            minimumSize: MaterialStateProperty.all(
                                const Size.fromHeight(50)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                            elevation: MaterialStateProperty.all(20),
                            overlayColor:
                                MaterialStateProperty.all(Colors.blue.shade900),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ))),
                        onPressed: () {
                          pickImage();
                        },
                        child: const Text('Attachment'),
                      ),
                    ),
                    Container(
                      height: 15,
                    ),
                    CommonBtn(
                      icon: Icon(Icons.save, color: Colors.white),
                      btnName: 'Submit',
                      callback: () {
                        if (validate()) {
                          CreateNewTutorial();
                        } else {
                          // Show error message
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Error',
                                  style: TextStyle(color: Colors.white),
                                ),
                                content: const Text('Please fill all fields.',
                                    style: TextStyle(color: Colors.white)),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text('OK',
                                        style: TextStyle(color: Colors.white)),
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
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
