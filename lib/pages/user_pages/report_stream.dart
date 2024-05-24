import 'package:elo_esports/models/report_stream.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportStreamPage extends StatelessWidget {
  ReportStreamPage({super.key, this.streamId, this.streamName, this.streamType});

  String? streamId;
  String? streamName;
  String? streamType;

  final DioClient dioClient = DioClient();

  TextEditingController nameEditingController = TextEditingController();
    TextEditingController emailEditingController = TextEditingController();
    TextEditingController mobileEditingController = TextEditingController();
    TextEditingController remarkEditingController = TextEditingController();
    String reportFor = 'option1';

    bool validate() {
      return nameEditingController.text.isNotEmpty &&
          emailEditingController.text.isNotEmpty &&
          mobileEditingController.text.isNotEmpty &&
          remarkEditingController.text.isNotEmpty;
    }

    reportStream(BuildContext context) async {
      ReportStream reportStream = ReportStream(
        streamId: streamId.toString(), 
        streamType: streamType, 
        streamName: streamName, 
        name: nameEditingController.text, 
        email: emailEditingController.text, 
        mobile: mobileEditingController.text, 
        reportFor: reportFor, 
        remark: remarkEditingController.text
      );

      await dioClient.streamReport(context, reportStream);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Stream reported successfully'),
      ));

      Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xff160E42),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InputField(label: 'Name', controller: nameEditingController),
            const SizedBox(
              height: 10,
            ),
            InputField(label: 'Email', controller: emailEditingController),
            const SizedBox(
              height: 10,
            ),
            // InputField(label: 'Mobile', controller: mobileEditingController),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mobile',
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
                    controller: mobileEditingController,
                    keyboardType: TextInputType.number,
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
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Report for',
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
                  width: double.infinity,
                  child: DropdownButton<String>(
                    value: reportFor,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.white),
                    underline: Container(
                      height: 2,
                      color: Colors.white,
                    ),
                    onChanged: (String? value) {
                      // setState(() {
                      //   dropdownValue = value!;
                      // });
                    },
                    items: ['option1', 'option2', 'option3'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            InputField(label: 'Remark', controller: remarkEditingController),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(const Color(0xff0F38CD)),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  minimumSize:
                      MaterialStateProperty.all(const Size.fromHeight(50)),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.fromLTRB(20, 10, 20, 10)),
                  elevation: MaterialStateProperty.all(20),
                  overlayColor: MaterialStateProperty.all(Colors.blue.shade900),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ))),
              onPressed: () {
                if (validate()) {
                  reportStream(context);
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
              child: const Text('Report stream'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        ),
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
