import 'package:batch5pm/utils/const.dart';
import 'package:batch5pm/utils/my_snackbar.dart';
import 'package:flutter/material.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> with TickerProviderStateMixin {
  final List<Widget> myTabs = [
    Tab(text: 'one'),
    Tab(text: 'two'),
    Tab(text: 'three'),
  ];

  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  _listItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.blueAccent,
        ),
      ),
      height: 120,
      child: Center(
        child: Text('List Item', style: TextStyle(fontSize: 20.0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          _listItem(),
          TabBar(
            controller: _tabController,
            labelColor: Colors.redAccent,
            tabs: myTabs,
          ),
          Center(
            child: [
              Text('first tab'),
              Column(
                children: [
                  Text('second tab'),
                  ...List.generate(10, (index) => Text('line: $index'))
                ],
              ),
              Column(
                children: [
                  Text('third tab'),
                  ...List.generate(20, (index) => Text('line: $index'))
                ],
              ),
            ][_tabController.index],
          ),
          _listItem(),
          _listItem(),
        ],
      ),
    );
  }
}
