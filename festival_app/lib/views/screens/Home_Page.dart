import 'package:festival_app/utils/Color_util.dart';
import 'package:festival_app/utils/MyRoutes.dart';
import 'package:flutter/material.dart';

import '../../utils/festival_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isGrid = false;

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    double height = s.height;
    double width = s.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Festy",
            style: TextStyle(
                fontFamily: 'Great Vibes',
                fontSize: 50,
                fontWeight: FontWeight.bold)),
        backgroundColor: theme_1,
        foregroundColor: theme_2,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isGrid = !isGrid;
                });
              },
              icon: Icon(Icons.grid_view_rounded))
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: width,
            height: 180,
            decoration: BoxDecoration(
                color: theme_1,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(300),
                  bottomLeft: Radius.circular(300),
                )),
          ),
          (isGrid)
              ? Padding(
                  padding: EdgeInsets.all(10),
                  child: GridView(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                    ),
                    children: List.generate(
                      allFestivals.length - 1,
                      (index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(MyRoutes.Detail_Page,
                              arguments: allFestivals[index + 1]);
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: listColor[index % listColor.length],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 110,
                                height: 110,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          allFestivals[index + 1]
                                              ['Network_image']),
                                    ),
                                    border: Border.all(
                                        color: listColor[
                                            index % listColor.length]),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        offset: Offset(2, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 10,
                                        offset: Offset(-2, -2),
                                      )
                                    ]),
                              ),
                              Text(
                                allFestivals[index + 1]['title'],
                                style: TextStyle(
                                    color: theme_2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: allFestivals.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => (index != 0)
                          ? GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    MyRoutes.Detail_Page,
                                    arguments: allFestivals[index]);
                              },
                              child: Container(
                                width: width - 20,
                                height: 95,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: listColor[index % listColor.length],
                                ),
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: ListTile(
                                  title: Text(
                                    "${allFestivals[index]['title']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: theme_2),
                                  ),
                                  subtitle: Text(
                                    "Create Your ${allFestivals[index]['title']} Tempalete ",
                                    // "Create Your ${allFestivaList[index].title} Tempalete ",
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: theme_2),
                                  ),
                                  trailing: Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: theme_2, width: 2),
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(2, 2),
                                        ),
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(-2, -2),
                                        )
                                      ],
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              allFestivals[index]
                                                  ['Network_image'])),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              width: width,
                              height: 40,
                              color: Colors.transparent,
                            )),
                ),
        ],
      ),
    );
  }
}
