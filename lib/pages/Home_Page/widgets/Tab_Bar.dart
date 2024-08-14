import 'package:flutter/material.dart';

myTabBar (TabController tabController, BuildContext context){
  return PreferredSize(
    preferredSize: Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: TabBar(
          controller: tabController,
          indicatorColor: Colors.orange,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelStyle: Theme.of(context).textTheme.labelLarge,

          labelStyle: Theme.of(context).textTheme.headlineSmall,
          tabs: [
            Text("Chats"),
            Text("Groups"),
            Text("Calls"),
          ]),
    ),
  );
}
