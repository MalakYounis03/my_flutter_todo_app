import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/extentions/space_exs.dart';
import 'package:todo_app/utils/app_color.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/utils/constants.dart';
import 'package:todo_app/views/home/components/fab.dart';
import 'package:todo_app/views/home/components/home_app_bar.dart';
import 'package:todo_app/views/home/components/slider_drawer.dart';
import 'package:todo_app/views/home/widget/task_widget.dart';
import 'package:animate_do/animate_do.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //final GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();

  final List<int> testing = [1];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      drawer: SliderDrawer(),
      floatingActionButton: Fab(),
      body: _buildHomeBody(textTheme),
      // body: SliderDrawer(
      //   Key: drawerKey,
      //   isdraggable: false,
      //   animationduration: 1000,

      //   slider: Container(),
      //   appBar: HomeAppBar(drawerKey: drawerKey),
      //   child: _buildHomeBody(textTheme),
      // ),
    );
  }

  SizedBox _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(
                    value: 1 / 3,
                    backgroundColor: Colors.grey,
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
                  ),
                ),
                25.w,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStr.mainTitle, style: textTheme.displayLarge),
                    3.h,
                    Text("1 of 3 tasks", style: textTheme.titleMedium),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Divider(thickness: 2, indent: 100),
          ),
          SizedBox(
            width: double.infinity,
            height: 700,
            child: testing.isNotEmpty
                ? ListView.builder(
                    itemCount: testing.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(index.toString()),
                        direction: DismissDirection.horizontal,
                        onDismissed: (direction) {},
                        background: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete_outline, color: Colors.grey),
                            8.w,
                            Text(
                              AppStr.deleteTasks,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                        child: TaskWidget(),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeIn(
                        child: SizedBox(
                          width: 200,
                          height: 200,

                          child: Lottie.asset(
                            lottieURL,
                            animate: testing.isNotEmpty ? false : true,
                          ),
                        ),
                      ),
                      FadeInUp(from: 30, child: Text(AppStr.doneAllTasks)),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
