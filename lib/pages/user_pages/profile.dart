import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = '/ProfilePage';

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {

  UserDetails? _userDetails;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  getUser() async {
    _userDetails = await SharedPreferencesService.getUserDetails();
    setState(() {});
  }
  
  @override
  Widget build(BuildContext context) {

    final DioClient dioClient = DioClient();

    // Controller for each text field
    TextEditingController bankNameController = TextEditingController();
    TextEditingController accountNumberController = TextEditingController();
    TextEditingController branchNameController = TextEditingController();
    TextEditingController ifscCodeController = TextEditingController();
    TextEditingController micrCodeController = TextEditingController();
    TextEditingController swiftCodeController = TextEditingController();
    TextEditingController routingNumberController = TextEditingController();

    bankNameController.text = _userDetails?.data?.bankDetails?.bankName ?? '';
    accountNumberController.text = _userDetails?.data?.bankDetails?.accountNumber ?? '';
    branchNameController.text = _userDetails?.data?.bankDetails?.branchName ?? '';
    ifscCodeController.text = _userDetails?.data?.bankDetails?.ifscCode ?? '';
    micrCodeController.text = _userDetails?.data?.bankDetails?.micrCode ?? '';
    swiftCodeController.text = _userDetails?.data?.bankDetails?.swiftCode ?? '';
    routingNumberController.text = _userDetails?.data?.bankDetails?.routingNumber ?? '';

    bool validate() {
      return bankNameController.text.isNotEmpty &&
          accountNumberController.text.isNotEmpty &&
          branchNameController.text.isNotEmpty &&
          ifscCodeController.text.isNotEmpty &&
          micrCodeController.text.isNotEmpty &&
          swiftCodeController.text.isNotEmpty &&
          routingNumberController.text.isNotEmpty;
    }

    updateBankDetails() async {
      BankDetails bankDetails = BankDetails(
        bankName: bankNameController.text,
        accountNumber: accountNumberController.text,
        branchName: branchNameController.text,
        ifscCode: ifscCodeController.text,
        micrCode: micrCodeController.text,
        swiftCode: swiftCodeController.text,
        routingNumber: routingNumberController.text, id: null, userId: null, createdAt: null, updatedAt: null,
      );
      await dioClient.updateBankDetails(context, bankDetails);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Bank details updated successfully'),
      ));

      _userDetails!.data?.copyWith(
        bankDetails: bankDetails
      );

      SharedPreferencesService.setUserDetails(_userDetails!);
    }

    return Scaffold(
      backgroundColor: const Color(0xff160E42),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: [
               Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _userDetails?.data?.user?.imageLink ??
                                          '--'),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(5)),
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

            const SizedBox(height: 30,),

            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF322B59),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(13, 11, 13, 9.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 5.4, 4),
                      child: Text(
                        'ELO Balance : 7000',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          letterSpacing: -0.4,
                          color: const Color(0xD9FFFFFF),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          height: 30,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xff125900)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                minimumSize: MaterialStateProperty.all(
                                    const Size.fromHeight(50)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0)),
                                elevation: MaterialStateProperty.all(20),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.blue.shade900),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ))),
                            onPressed: () {},
                            child: const Text(
                              'Transfer to paypal',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 130,
                          height: 30,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xffB70018)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                minimumSize: MaterialStateProperty.all(
                                    const Size.fromHeight(50)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(0)),
                                elevation: MaterialStateProperty.all(20),
                                overlayColor: MaterialStateProperty.all(
                                    Colors.blue.shade900),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                ))),
                            onPressed: () {},
                            child: const Text(
                              'Purchase ELO',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30,),

            Text(
              'Profile :',
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

            const SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
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
                   SizedBox(
                      width: 100,
                      child: Text(
                        _userDetails?.data?.user?.username ?? '--',
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
                    ),
                  ],
                ),

                const SizedBox(width: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
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
                    SizedBox(
                      width: 200,
                      child: Text(
                        _userDetails?.data?.user?.email ?? '--',
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
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 10,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Phone',
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
                   SizedBox(
                      width: 100,
                      child: Text(
                        _userDetails?.data?.user?.phone ?? '--',
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
                    ),
                  ],
                ),

                const SizedBox(width: 20,),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
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
                    SizedBox(
                      width: 200,
                      child: Text(
                        _userDetails?.data?.user?.address ?? '--',
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
                    ),
                  ],
                )
              ],
            ),
          
            const SizedBox(height: 30,),

            Text(
              'Bank Details :',
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

            const SizedBox(height: 10,),

           Row(
            children: [
              BankField(
                label: 'Bank Name',
                controller: bankNameController,
              ),
              const SizedBox(width: 10),
              BankField(
                label: 'Account Number',
                controller: accountNumberController,
              ),
            ],
           ),
            const SizedBox(height: 10),
            Row(
              children: [
                BankField(
                  label: 'Branch Name',
                  controller: branchNameController,
                ),
                const SizedBox(width: 10),
                BankField(
                  label: 'IFSC Code',
                  controller: ifscCodeController,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                BankField(
                  label: 'MICR Code',
                  controller: micrCodeController,
                ),
                const SizedBox(width: 10),
                BankField(
                  label: 'SWIFT Code',
                  controller: swiftCodeController,
                ),
              ],
            ),
            const SizedBox(height: 10),
            BankField(
              label: 'Routing Number',
              controller: routingNumberController,
            ),
            const SizedBox(height: 20),
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
                // Save button logic
                if (validate()) {
                  updateBankDetails();
                } else {
                  // Show error message
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error', style: TextStyle(color: Colors.white),),
                        content: const Text('Please fill all fields.', style: TextStyle(color: Colors.white)),
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
          ]),
        ),
      ),
    );
  }
}

class BankField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const BankField({
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
            fontSize: 12,
            letterSpacing: -0.4,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        SizedBox(
          width: 150,
          height: 60,
          child: TextField(
            controller: controller,
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