import 'package:flutter/material.dart';
import 'package:olacab/tabpages/earning_tab.dart';
import 'package:olacab/tabpages/hometab.dart';
import 'package:olacab/tabpages/profile_tab.dart';
import 'package:olacab/tabpages/ratings_tab.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  TabController? tabController;
  int selectedIndex=0;

  onItemclicked(int index){
    setState(() {
      selectedIndex=index;
      tabController!.index=selectedIndex;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 4, vsync: this);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: tabController,
        children: const [
          HomeTabPage(),
          EarningTabPage(),
          RatingTabPage(),
          ProfileTabPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "HOME"),

          BottomNavigationBarItem(icon: Icon(Icons.credit_card),
              label: "Earnings"),

          BottomNavigationBarItem(icon: Icon(Icons.star),
              label: "Ratings"),

          BottomNavigationBarItem(icon: Icon(Icons.person),
              label: "Account"),
        ],

        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 14),
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        onTap: onItemclicked,
      ),
    );
  }
}
