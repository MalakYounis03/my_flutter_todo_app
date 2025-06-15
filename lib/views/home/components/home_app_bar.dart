import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key /*required this.drawerKey*/});
  // final GlobalKey<SliderDrawerState> drawerKey;
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animateController;
  bool isDrawerOpened = false;
  @override
  void initState() {
    animateController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    super.initState();
  }

  @override
  void dispose() {
    animateController.dispose();
    super.dispose();
  }

  void OnDrawerToggle() {
    setState(() {
      isDrawerOpened = !isDrawerOpened;
      if (isDrawerOpened) {
        animateController.forward();
        //widget.drawerKey.currentState!.openSlider();
      } else {
        animateController.reverse();
        // widget.drawerKey.currentState!.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: OnDrawerToggle,
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: animateController,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(CupertinoIcons.trash_fill, size: 40),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
