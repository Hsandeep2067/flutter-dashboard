import 'package:flutter/material.dart';
import 'about_us_page.dart';
import 'calendar_page.dart';
import 'contact_us_page.dart';
import 'dashboard_page.dart';
import 'email_page.dart';
import 'profile_page.dart';
import 'reports_page.dart';
import 'settings_page.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.dashboard_outlined), text: 'Dashboard'),
            Tab(icon: Icon(Icons.insert_drive_file_outlined), text: 'Reports'),
            Tab(icon: Icon(Icons.calendar_today_outlined), text: 'Calendar'),
            Tab(icon: Icon(Icons.email_outlined), text: 'Email'),
            Tab(icon: Icon(Icons.person_outline), text: 'Profile'),
            Tab(icon: Icon(Icons.settings_outlined), text: 'Settings'),
            Tab(icon: Icon(Icons.info_outline), text: 'About Us'),
            Tab(icon: Icon(Icons.contact_mail_outlined), text: 'Contact Us'),
          ],
        ),
      ),
      body: Row(
        children: [
          Drawer(
            child: _Sidebar(
              onTabSelected: (index) {
                _tabController.animateTo(index);
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                DashboardPage(),
                ReportsPage(),
                CalendarPage(),
                EmailPage(),
                ProfilePage(),
                SettingsPage(),
                AboutUsPage(),
                ContactUsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Sidebar extends StatelessWidget {
  final Function(int) onTabSelected;

  const _Sidebar({required this.onTabSelected, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 50,
        ),
        ListTile(
          leading: Icon(Icons.dashboard_outlined),
          title: Text('Dashboard'),
          onTap: () => onTabSelected(0),
        ),
        ListTile(
          leading: Icon(Icons.insert_drive_file_outlined),
          title: Text('Reports'),
          onTap: () => onTabSelected(1),
        ),
        ListTile(
          leading: Icon(Icons.calendar_today_outlined),
          title: Text('Calendar'),
          onTap: () => onTabSelected(2),
        ),
        ListTile(
          leading: Icon(Icons.email_outlined),
          title: Text('Email'),
          onTap: () => onTabSelected(3),
        ),
        ListTile(
          leading: Icon(Icons.person_outline),
          title: Text('Profile'),
          onTap: () => onTabSelected(4),
        ),
        ListTile(
          leading: Icon(Icons.settings_outlined),
          title: Text('Settings'),
          onTap: () => onTabSelected(5),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text('About Us'),
          onTap: () => onTabSelected(6),
        ),
        ListTile(
          leading: Icon(Icons.contact_mail_outlined),
          title: Text('Contact Us'),
          onTap: () => onTabSelected(7),
        ),
      ],
    );
  }
}
