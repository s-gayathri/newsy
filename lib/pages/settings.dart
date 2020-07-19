import 'package:flutter/material.dart';
import 'package:newsy/components/customAppBar.dart';
import 'package:newsy/components/customBottomBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> allPreferences = [
    'Art',
    'Business',
    'Cinema',
    'Education',
    'Environment',
    'Fashion',
    'Food',
    'Government',
    'Health',
    'Politics',
    'Science',
    'Sports',
    'Technology',
    'World'
  ];

  List<String> notPreferences = [];
  List<String> preferences = [];
  SharedPreferences prefs;

  Future<void> getPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      preferences = prefs.getStringList('preferences');
      notPreferences = allPreferences;
      notPreferences.removeWhere((element) => preferences.contains(element));
    });
  }

  // Tap to add
  Future<void> addPreferences(String pref) async {
    print('Add Pref $pref');
    prefs = await SharedPreferences.getInstance();

    setState(() {
      preferences.add(pref);
      notPreferences.remove(pref);
    });

    prefs.setStringList('preferences', preferences);
  }

  // Long press to remove
  Future<void> removePreferences(String pref) async {
    print('Remove Pref $pref');
    prefs = await SharedPreferences.getInstance();

    setState(() {
      preferences.remove(pref);
      notPreferences.add(pref);
    });

    prefs.setStringList('preferences', preferences);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      preferences = [];
      notPreferences = [];
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getPreferences();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
                Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: PreferredSize(
        child: CustomBottomBar(),
        preferredSize: Size(double.infinity, 50),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xfffcda92), const Color(0xfff9e9c6)],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: displayPreferences(),
      ),
    );
  }

  Widget displayPreferences() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'EDIT PREFERENCES',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 34,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Tap to add to preferences and long press to remove.',
            style: TextStyle(
              fontFamily: 'Quicksand',
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: getPreferenceValues(),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: MediaQuery.of(context).size.width,
            ),
            // fit: FlexFit.tight,
            child: ListView.separated(
              itemCount: notPreferences.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 10.0),
              itemBuilder: (BuildContext context, int index) => ButtonTheme(
                minWidth: 100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: FlatButton(
                  color: Colors.white,
                  child: Text(
                    notPreferences[index],
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () => addPreferences(notPreferences[index]),
                  // onLongPress: () => removePreferences(e),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
        ],
      ),
    );
  }

  Widget getPreferenceValues() {
    if (preferences == [])
      return Center(
          child: Text(
        'You have no preferences. Tap on the buttons below to add preferences.',
        style: TextStyle(
          fontFamily: 'Quicksand',
          fontSize: 23,
          color: const Color(0xff000000),
          fontWeight: FontWeight.w600,
        ),
      ));
    else
      return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(20.0),
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 15.0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 5.5),
        children: preferences
            .map(
              (pref) => ButtonTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: RaisedButton(
                  color: Colors.white,
                  child: Text(
                    pref,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () => {},
                  onLongPress: () => removePreferences(pref),
                ),
              ),
            )
            .toList(),
      );
  }
}
