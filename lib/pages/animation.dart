import 'package:flutter/material.dart';
import 'package:newsy/components/customAppBar.dart';
import 'package:newsy/components/customBottomBar.dart';

class NewsyAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffcda92),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 120.0),
        child: Container(
          child: AppBar(
            leading: Container(),
            backgroundColor: const Color(0xfffffefe),
            elevation: 0,
            flexibleSpace: Column(
              children: <Widget>[
                CustomAppBar(),
                BackButton(
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
          child: CustomBottomBar(), preferredSize: Size(double.infinity, 50)),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(-10.0),
              bottomLeft: Radius.circular(-10.0)),
          gradient: LinearGradient(
            colors: [const Color(0xfffcda92), const Color(0xfff9e9c6)],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(child: Text('Animation Page')),
      ),
    );
  }
}
