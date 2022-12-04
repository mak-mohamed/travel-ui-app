import 'package:flutter/material.dart';
import 'package:travel_ui/data/data.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(),
          BestPlacess(
            title: "Best Place",
            imagelist: listimage,
            titlelist: listcounty,
          ),
          BestPlacess(
            title: "Best Hotel",
            imagelist: listhotelimage,
            titlelist: listhotel,
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("lib/assets/images2.jpg"), fit: BoxFit.cover),
      ),
      child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.2),
                Colors.black.withOpacity(.2)
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "What You Would Like To Find ?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 15),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                //! search in appbar
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.search_rounded),
                        hintText: "Search For Places & Hotel ...",
                        hintStyle: TextStyle(
                            fontSize: MediaQuery.of(context).size.width / 35)),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 25),
              ],
            ),
          )),
    );
  }
}

class BestPlacess extends StatelessWidget {
  final String title;
  final List<String> titlelist;
  final List<String> imagelist;
  BestPlacess(
      {super.key,
      required this.title,
      required this.titlelist,
      required this.imagelist});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width / 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800]),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: MediaQuery.of(context).size.width / 5,
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8),
                scrollDirection: Axis.horizontal,
                itemCount: titlelist.length,
                itemBuilder: (context, index) => CustomCard(
                  countryName: titlelist[index],
                  assetPath: imagelist[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String assetPath;
  final String countryName;
  const CustomCard(
      {super.key, required this.assetPath, required this.countryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width * 0.4,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.8)
                  ],
                ),
                image: DecorationImage(
                    image: AssetImage(assetPath), fit: BoxFit.cover)),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.1),
                    Colors.black.withOpacity(.5)
                  ],
                ),
              ),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      countryName,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
          )),
    );
  }
}
