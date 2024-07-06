import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';
import 'package:workpulse_flutter_frontend/views/home/home_view.dart';
import 'package:workpulse_flutter_frontend/views/jobs/job_view.dart';
import 'package:workpulse_flutter_frontend/views/loan/loan_view.dart';
import 'package:workpulse_flutter_frontend/views/profile/profile_view.dart';
import 'package:workpulse_flutter_frontend/views/schedule/schedule_view.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  int _selectedIndex = 0;

  static const List<Widget> _page = <Widget>[
    HomePageView(),
    JobsPageView(),
    SchedulePageView(),
    LoanPageView(),
    ProfilePageView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _page.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_outlined),
            label: 'Jobs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'Loan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: AppColor().matteBlack,
        selectedItemColor: AppColor().electricIndigo,
        elevation: 5,
        onTap: _onItemTapped,
      ),
    );
  }
}
