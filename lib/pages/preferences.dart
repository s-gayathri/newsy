import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:newsy/components/customAppBar.dart';

class Preferences extends StatefulWidget {
  @override
  _PreferencesState createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  SharedPreferences prefs;

  List<String> preferences = [];

  Future<void> setIsFirstLaunched() async {
    // prefs.clear();
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstLaunch', false);
  }

  void setPrefs(String topic) {
    setState(() {
      preferences.add(topic);
    });
    prefs.setStringList('preferences', preferences);
  }

  @override
  Widget build(BuildContext context) {
    setIsFirstLaunched();

    return Scaffold(
      backgroundColor: const Color(0xfffcda92),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 111.0),
        child: CustomAppBar(),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xfffecd63), const Color(0xfffcda92)],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height / 14),
              Text(
                'CHOOSE PREFERENCES',
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontSize: 34,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: GridView.count(
                  padding: EdgeInsets.all(10.0),
                  crossAxisCount: 1,
                  scrollDirection: Axis.horizontal,
                  childAspectRatio: (MediaQuery.of(context).size.width) /
                      (MediaQuery.of(context).size.height / 4.25),
                  children: <Widget>[
                    getPreferenceCard(
                        pref: 'Art', pathToImage: 'assets/images/art.jpeg'),
                    getPreferenceCard(
                        pref: 'Business',
                        pathToImage: 'assets/images/business.jpg'),
                    getPreferenceCard(
                        pref: 'Cinema',
                        pathToImage: 'assets/images/cinema.jpg'),
                    getPreferenceCard(
                        pref: 'Education',
                        pathToImage: 'assets/images/education.jpg'),
                    getPreferenceCard(
                        pref: 'Environment',
                        pathToImage: 'assets/images/environment.jpg'),
                    getPreferenceCard(
                        pref: 'Fashion',
                        pathToImage: 'assets/images/fashion.jpg'),
                    getPreferenceCard(
                        pref: 'Food', pathToImage: 'assets/images/food.jpg'),
                    getPreferenceCard(
                        pref: 'Government',
                        pathToImage: 'assets/images/government.jpeg'),
                    getPreferenceCard(
                        pref: 'Health',
                        pathToImage: 'assets/images/health.jpg'),
                    getPreferenceCard(
                        pref: 'Politics',
                        pathToImage: 'assets/images/politics.jpg'),
                    getPreferenceCard(
                        pref: 'Science',
                        pathToImage: 'assets/images/science.png'),
                    getPreferenceCard(
                        pref: 'Sports',
                        pathToImage: 'assets/images/sports.png'),
                    getPreferenceCard(
                        pref: 'Technology',
                        pathToImage: 'assets/images/technology.jpg'),
                    getPreferenceCard(
                        pref: 'World', pathToImage: 'assets/images/world.jpg'),
                  ],
                ),
              ),
              ButtonTheme(
                minWidth: 200.0,
                height: 70.0,
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  color: Colors.white,
                  textColor: Colors.black,
                  child: Text(
                    "Proceed".toUpperCase(),
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 25,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 14),
            ],
          ),
        ),
      ),
    );
  }

  Widget getPreferenceCard({String pref, String pathToImage}) {
    return GestureDetector(
      onTap: () => setPrefs(pref),
      child: Center(
        child: Container(
          height: 300.0,
          margin: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(pathToImage),
              )),
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                top: 0.0,
                child: Container(
                    padding: EdgeInsets.all(10.0),
                    height: 350.0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        pref,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          fontSize: 28,
                          color: const Color(0xffffffff),
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      color: const Color(0x66000000),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
