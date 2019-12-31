import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/flutter_widgets.dart';

void main() => runApp(HomeScreen());
int currentTab = 0;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenPage createState() => _HomeScreenPage();
}

class TabModel {
  String text;

  TabModel({this.text});
}

List<TabModel> _tabList = [
  TabModel(text: "Android"),
  TabModel(text: "IOS"),
  TabModel(text: "Java"),
  TabModel(text: "JavaScript"),
  TabModel(text: "PHP"),
  TabModel(text: "HTML"),
  TabModel(text: "C++"),
];

class _HomeScreenPage extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController _controller = PageController(initialPage: 0, keepPage: false);

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionListener =
      ItemPositionsListener.create();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.purple,
            brightness: Brightness.light,
            accentColor: Colors.red),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("Custom TabBar"),
            ),
            body: Column(
              children: <Widget>[
                Container(
                    height: 60,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14.0),
                        border: Border.all(color: Colors.black, width: 1.0)),
                    child: ScrollablePositionedList.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _tabList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            gradient: currentTab == index
                                ? LinearGradient(
                                    colors: [
                                      Colors.redAccent,
                                      Colors.redAccent[200],
                                      Colors.redAccent[100]
                                    ],
                                  )
                                : null,
                            borderRadius: BorderRadius.circular(13.0),
                          ),
                          child: FlatButton(
                            color: Colors.transparent,
                            onPressed: () {
                              setState(() {
                                currentTab = index;
                                _controller.jumpToPage(currentTab);
                              });
                            },
                            child: Text(
                              _tabList[index].text,
                            ),
                          ),
                        );
                      },
                      itemScrollController: itemScrollController,
                      itemPositionsListener: itemPositionListener,
                    )),
                Flexible(
                    child: Container(
                  child: PageView(
                    controller: _controller,
                    onPageChanged: (pageId) {
                      setState(() {
                        currentTab = pageId;
                        itemScrollController.scrollTo(
                            index: currentTab, duration: Duration(seconds: 1));
                      });
                    },
                    children: <Widget>[
                      Container(
                        color: Colors.pink,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.cyan,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.red,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.grey,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.purple,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.teal,
                        child: Center(
                          child: Text(
                            _tabList[currentTab].text,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            )));
  }
}
