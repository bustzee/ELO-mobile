import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = '/ProfilePage';

  @override
  State<ProfilePage> createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile_dummy.png'),
                        fit: BoxFit.cover),
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
                      'Amit Bodke',
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
                      'Stream key :\n12313465467894545131346',
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
                        'AmitBodke',
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
                        'amit.bodke@cyberscriptit.com',
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
                        '+17845674567',
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
                        'Address will be shown here on this line',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Bank name',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: 'Central bank',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account number',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: '1324561231234',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Branch name',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: 'Central bank',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'IFSC code',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: '1324561231234',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MICR Code',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: 'Central bank',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SWIFT Code',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: '1324561231234',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Routing Number',
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
                    const SizedBox(
                      width: 150,
                      height: 60,
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          fillColor: Color(0xff262657),
                          filled: true,
                          hintText: 'Central bank',
                          hintStyle: TextStyle(
                            fontSize: 10,
                          )
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          
            const SizedBox(height: 10,),

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
                    onPressed: () {},
                    child: const Text(
                      'Save details',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
          ]),
        ),
      ),
    );
  }
}
