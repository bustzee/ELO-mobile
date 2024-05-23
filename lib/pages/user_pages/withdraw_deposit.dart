import 'package:elo_esports/models/deposit.dart';
import 'package:elo_esports/models/user_details.dart';
import 'package:elo_esports/models/withdrawal.dart';
import 'package:elo_esports/network/dio_client.dart';
import 'package:elo_esports/pages/user_widgets/loader.dart';
import 'package:elo_esports/utilities/shared_preferences_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:intl/intl.dart';

class WithdrawDepositPage extends StatefulWidget {
  const WithdrawDepositPage({super.key});
  static String id = '/WithdrawDepositPage';

  @override
  State<WithdrawDepositPage> createState() => WithdrawDepositPageState();
}

class WithdrawDepositPageState extends State<WithdrawDepositPage> {
  final DioClient dioClient = DioClient();
  
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff160E42),
        appBar: AppBar(
          backgroundColor: const Color(0xFF322B59),
          title: Text(
            'My Account',
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
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: LineIcon(LineIcons.moneyCheck),
                text: 'Deposits',
              ),
              Tab(
                icon: LineIcon(LineIcons.moneyCheck),
                text: 'Withdrawals',
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(children: [
            FutureBuilder<Deposit?>(
                future: dioClient.getListOfDeposits(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  } else {
                    return DepositList(deposit: snapshot.data);
                  }
                }),

            // WITHDRAWALS
             FutureBuilder<Withdrawal?>(
                future: dioClient.getListOfWithdrawals(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Loader();
                  } else {
                    return WithdrawList(withdraws: snapshot.data);
                  }
                }),
          ]),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class WithdrawList extends StatelessWidget {
  WithdrawList({super.key, this.withdraws});

  Withdrawal? withdraws;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: withdraws?.withdrawals?.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 150,
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction Id / Email id',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        withdraws?.withdrawals?[index].transactionIdEmailId ?? '--',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Withdrawal amount',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                withdraws?.withdrawals?[index].transactionAmount ?? '--',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                withdraws?.withdrawals?[index].onDate ?? '--',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}


// ignore: must_be_immutable
class DepositList extends StatelessWidget {
  DepositList({super.key, this.deposit});

  Deposit? deposit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: deposit?.deposits?.length,
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 150,
              child: Card(
                color: const Color(0xFF322B59),
                shape: const RoundedRectangleBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Transaction Id / Email id',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        deposit?.deposits?[index].transactionId ?? '--',
                        style: GoogleFonts.getFont(
                          'Open Sans',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          letterSpacing: -0.4,
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Deposited amount',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                deposit?.deposits?[index].depositedAmount ?? '--',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                (DateFormat('yyyy-MM-dd').format(deposit?.deposits?[index].date?? DateTime.now()) ?? '--'),
                                style: GoogleFonts.getFont(
                                  'Open Sans',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  letterSpacing: -0.4,
                                  color: Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
