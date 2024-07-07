import 'package:flutter/material.dart';
import 'package:workpulse_flutter_frontend/models/color_model.dart';

class JobsPageView extends StatefulWidget {
  const JobsPageView({super.key});

  @override
  State<JobsPageView> createState() => _JobsPageViewState();
}

class _JobsPageViewState extends State<JobsPageView>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget jobCategories() {
      Widget appBarTitle = const Text(
        "Jobs",
        style: TextStyle(fontWeight: FontWeight.w500),
      );

      return DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: AppColor().milkWhite,
                  title: appBarTitle,
                  pinned: true,
                  floating: true,
                  automaticallyImplyLeading: false,
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    labelColor: AppColor().electricIndigo,
                    indicatorColor: AppColor().electricIndigo,
                    indicatorSize: TabBarIndicatorSize.tab,
                    controller: _tabController,
                    tabs: const <Widget>[
                      Tab(
                        text: "All",
                      ),
                      Tab(
                        text: "Active",
                      ),
                      Tab(
                        text: "Past",
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  color: AppColor().lightGrey,
                  child: const Center(
                    child: Text('All Jobs'),
                  ),
                ),
                Container(
                  color: AppColor().lightGrey,
                  child: const Center(
                    child: Text('Active Jobs'),
                  ),
                ),
                Container(
                  color: AppColor().lightGrey,
                  child: const Center(
                    child: Text('Past Jobs'),
                  ),
                )
              ],
            )),
      );
    }

    return Scaffold(
      backgroundColor: AppColor().lightGrey,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: jobCategories(),
          ),
        ],
      ),
    );
  }
}
