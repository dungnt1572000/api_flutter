import 'package:bloc_training/model/catpage.dart';
import 'package:bloc_training/model/datum.dart';
import 'package:bloc_training/repository/fetchData.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureCatPage = APIService().fetchCatPage(breeds_url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: FutureBuilder<CatPage>(
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
                                futureCatPage=APIService().fetchCatPage(
                                    snapshot.data!.prevPageUrl!);
                              });
                            },
                            child: Icon(Icons.arrow_back))
                        : SizedBox(),
                    Text(snapshot.data!.currentPage.toString()),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          futureCatPage = APIService()
                              .fetchCatPage(snapshot.data!.nextPageUrl);
                        });
                      },
                      child: Icon(Icons.navigate_next),
                    )
                      ],
                    ),
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
            }));
  }
}
