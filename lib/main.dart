import 'dart:developer';

import 'package:bloc_training/model/catpage.dart';
import 'package:bloc_training/model/datum.dart';
import 'package:bloc_training/model/page2/user_respone.dart';
import 'package:bloc_training/page2.dart';
import 'package:bloc_training/repository/fetchData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Future<void> main() async {
  runApp(const MyApp());
  // ApiUser apiUser = ApiUser(Dio(BaseOptions(
  //   contentType: 'application/json')));
  // var futureUser = await apiUser.getInForUser(authen);
  // print(futureUser.toString());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int counter;
  late Future<CatPage> futureCatPage;
  late Future<UserRespone> futureRespone;
  ApiClient rest = ApiClient(Dio(BaseOptions(contentType: 'application/json')));
  ApiUser apiUser = ApiUser(Dio(BaseOptions(contentType: 'application/json')));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    counter = 1;
    // futureCatPage = APIService().fetchCatPage(breeds_url);
    futureCatPage = rest.getCatPage(counter);
    futureRespone = apiUser.getInForUser(authen,4016);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Page2()));
          },
          child: Icon(Icons.navigate_next),
        ),
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: [
            FutureBuilder<UserRespone>(
                future: futureRespone,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Can not connect');
                  } else if (snapshot.hasData) {
                    return Text(snapshot.data.toString());
                  }
                  return const CircularProgressIndicator();
                }),
            Expanded(
              child: FutureBuilder<CatPage>(
                  future: futureCatPage,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Datum> dt = snapshot.data!.datum;
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              snapshot.data!.prevPageUrl != null
                                  ? ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          counter--;
                                          futureCatPage =
                                              rest.getCatPage(counter);
                                          // futureCatPage = APIService().fetchCatPage(
                                          //     snapshot.data!.prevPageUrl!);
                                        });
                                      },
                                      child: Icon(Icons.arrow_back))
                                  : SizedBox(),
                              Text(snapshot.data!.currentPage.toString()),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    counter++;
                                    futureCatPage = rest.getCatPage(counter);

                                    // futureCatPage = APIService()
                                    //     .fetchCatPage(snapshot.data!.nextPageUrl);
                                  });
                                },
                                child: Icon(Icons.navigate_next),
                              )
                            ],
                          ),
                          Text('ok'),
                          Expanded(
                            child: ListView.builder(
                                itemCount: dt.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(dt[index].breed),
                                    subtitle:
                                        Text('Come from ${dt[index].country}'),
                                  );
                                }),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }),
            ),
          ],
        ));
  }
}
