import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'News',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30,
                color: const Color(0xfffffdfd),
              ),
            ),
            Text(
              'y',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30,
                color: const Color(0xffffcd61),
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: const Color(0xff000000),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.elliptical(450.0, 55.5),
          bottomRight: Radius.elliptical(450.0, 55.5),
        ),
      ),
    );
  }
}
