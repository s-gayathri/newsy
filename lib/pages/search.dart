import 'package:flutter/material.dart';
import 'package:newsy/components/customAppBar.dart';
import 'package:newsy/components/customBottomBar.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final controller = TextEditingController();
  String query;
  final allTopics = [
    'European Football',
    'Trump',
    'Germany',
    'Cooking',
    'Bitcoin',
    'Weather',
    'Thanksgiving',
  ];

  final trendingTropics = [
    'European Football',
    'Trump',
    'Weather',
  ];

  Widget buildSuggestions(BuildContext context, String query) {
    // show suggestions when user starts to search for something
    final suggestionList = query.isEmpty
        ? trendingTropics
        : allTopics.where((element) => element.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.pushNamed(context, '/search-results',
            arguments: {'query': suggestionList[index]}),
        leading: Icon(Icons.trending_up),
        title: RichText(
            text: TextSpan(
                text: suggestionList[index].substring(0, query.length),
                children: [
                  TextSpan(
                      text: suggestionList[index].substring(query.length),
                      style: TextStyle(color: Colors.grey))
                ],
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black))),
      ),
      itemCount: suggestionList.length,
    );
  }

  void onSearchChange() {
    print('Text Field Value: ${controller.text}');
    setState(() {
      query = controller.text;
    });
  }

  @override
  void initState() {
    super.initState();
    controller.text = '';
    controller.addListener(onSearchChange);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BackButton(
                      color: Colors.black,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey[800],
                            ),
                          ),
                          hintText: 'search',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () => Navigator.pushNamed(
                          context, '/search-results',
                          arguments: {'query': controller.text}),
                    ),
                  ],
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
          gradient: LinearGradient(
            colors: [const Color(0xfffcda92), const Color(0xfff9e9c6)],
            begin: FractionalOffset.bottomCenter,
            end: FractionalOffset.topCenter,
            tileMode: TileMode.clamp,
          ),
        ),
        child: buildSuggestions(context, controller.text),
      ),
    );
  }
}

// class NewsSearch extends SearchDelegate<String> {
//   final allTopics = [
//     'European Football',
//     'Trump',
//     'Germany',
//     'Cooking',
//     'Bitcoin',
//     'Weather',
//     'Thanksgiving',
//   ];

//   final trendingTropics = [
//     'European Football',
//     'Trump',
//     'Weather',
//   ];

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     // action to be performed
//     return [IconButton(icon: Icon(Icons.clear), onPressed: () => query = "")];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     // leading icon on the left of the bar
//     return IconButton(
//         icon: AnimatedIcon(
//             icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
//         onPressed: () => close(context, null));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // show some results based on the search string
//     // Navigator.of(context).popAndPushNamed('/settings');
//     return MaterialApp(
//       home: Scaffold(
//         appBar: ExtendedAppBar(['$query']),
//         body: Center(
//           child: Text('Search Results'),
//         ),
//         bottomNavigationBar: CustomBottomBar(),
//       ),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // show when someone searches for something
//     final suggestionList = query.isEmpty
//         ? trendingTropics
//         : allTopics.where((element) => element.startsWith(query)).toList();

//     return ListView.builder(
//       itemBuilder: (context, index) => ListTile(
//         onTap: () => showResults(context),
//         leading: Icon(Icons.trending_up),
//         title: RichText(
//             text: TextSpan(
//                 text: suggestionList[index].substring(0, query.length),
//                 children: [
//                   TextSpan(
//                       text: suggestionList[index].substring(query.length),
//                       style: TextStyle(color: Colors.grey))
//                 ],
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.black))),
//       ),
//       itemCount: suggestionList.length,
//     );
//   }
// }
