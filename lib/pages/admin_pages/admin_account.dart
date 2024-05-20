import 'package:elo_esports/pages/admin_pages/admin_completed_stream.dart';
import 'package:elo_esports/pages/admin_pages/admin_dashboard.dart';
import 'package:elo_esports/pages/admin_pages/admin_inprogress_stream.dart';
import 'package:elo_esports/pages/user_pages/user_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminAccount extends StatefulWidget {
  const AdminAccount({super.key});
  static String id = '/AdminAccount';

  @override
  State<StatefulWidget> createState() => _AdminAccountState();
}

class _AdminAccountState extends State<AdminAccount> {
  int _selectedIndex = 0;

  final List<Widget> _widgetList = [
    AdminDashboard(),
    AdminInprogressStream(),
    AdminCompletedStream(),
    // const MyBetsPage(),
    // const ProfilePage(),
    // const MenuPage(),
  ];

  NavigateToTapMenu(int TapIndex) {
    _selectedIndex = TapIndex;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF160E42),
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: Color.fromARGB(255, 255, 255, 255)),
          backgroundColor: const Color(0xFF322B59),
          title: SizedBox(
              height: 50,
              width: 100,
              child: Image.asset('assets/images/logo.png')),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xFF322B59),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage('assets/images/profile_dummy.png'),
                            fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
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
              ),
              // Header Code
              Container(
                child: (Column(
                  children: <Widget>[
                    ExpansionTile(
                      onExpansionChanged: (bool isExpanded) {
                        Navigator.pushNamed(context, UserDashboardPage.id);
                      },
                      collapsedIconColor: Colors.white,
                      title: const Text(
                        'Home',
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: Icon(Icons.home,
                          color: Colors.white), // Ensure icon color is set here
                      iconColor: Colors.white,
                      textColor: Colors
                          .white, // You can directly use Colors.white here
                      trailing: SizedBox.shrink(), // Remove trailing widget
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: ExpansionTile(
                        onExpansionChanged: (bool isExpanded) {
                          NavigateToTapMenu(0);
                          Navigator.pop(context);
                        },
                        collapsedIconColor: Colors.white,
                        title: const Text(
                          'Dashboard',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(Icons.dashboard),
                        iconColor: Colors.white,
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        trailing: SizedBox.shrink(),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: const Text(
                          'Live Stream',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(Icons.stream),
                        iconColor: Colors.white,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        // trailing: Icon(Icons.arrow_drop_down),
                        children: <Widget>[
                          ListTile(
                            title: const Text('In Progress'),
                            onTap: () {
                              NavigateToTapMenu(1);
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            title: const Text('Completed'),
                            onTap: () {
                              NavigateToTapMenu(2);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: const Text(
                          'User Account Settings',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(Icons.account_box),
                        iconColor: Colors.white,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        // trailing: Icon(Icons.arrow_drop_down),
                        children: <Widget>[
                          ListTile(
                            title: const Text('Users'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Admin Lists'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Role'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: const ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: Text(
                          'Filter Words',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.text_format),
                        iconColor: Colors.white,
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        trailing: SizedBox.shrink(),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: const ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: Text(
                          'Setting',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.settings),
                        iconColor: Colors.white,
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        trailing: SizedBox.shrink(),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: const Text(
                          'Betting Amount Master',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(Icons.view_agenda),
                        iconColor: Colors.white,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        // trailing: Icon(Icons.arrow_drop_down),
                        children: <Widget>[
                          ListTile(
                            title: const Text('Add New'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('List'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: const Text(
                          'Betting View Master',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(Icons.view_array),
                        iconColor: Colors.white,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        // trailing: Icon(Icons.arrow_drop_down),
                        children: <Widget>[
                          ListTile(
                            title: const Text('Add New'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('List'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: const ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: Text(
                          'Tutorials',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.developer_mode),
                        iconColor: Colors.white,
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        trailing: SizedBox.shrink(),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: const Text(
                          'Reports',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: const Icon(Icons.view_array),
                        iconColor: Colors.white,
                        textColor: const Color.fromARGB(255, 255, 255, 255),
                        // trailing: Icon(Icons.arrow_drop_down),
                        children: <Widget>[
                          ListTile(
                            title: const Text('Streaming Report'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Reported Streams'),
                            onTap: () {},
                          ),
                          ListTile(
                            title: const Text('Betting Disputes'),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent, // Remove the border
                      ),
                      child: const ExpansionTile(
                        collapsedIconColor: Colors.white,
                        title: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: Icon(Icons.logout),
                        iconColor: Colors.white,
                        textColor: Color.fromARGB(255, 255, 255, 255),
                        trailing: SizedBox.shrink(),
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
        body: _widgetList[_selectedIndex],
      ),
    );
  }
}
