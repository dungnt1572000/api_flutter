import 'package:bloc_training/model/page2/user_create.dart';
import 'package:bloc_training/model/page2/user_respone.dart';
import 'package:bloc_training/repository/fetchData.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

enum Sex { male, female }

class _Page2State extends State<Page2> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  bool isactive = true;
  Sex sex = Sex.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var userCreate = UserCreate(username.text, email.text, sex.name,
              isactive ? 'active' : 'inactive');
          print('alo' + userCreate.toString());
          // print(userCreate.gender);
          // var userRespone = await APIService().createUser(userCreate);

          var userRespone =
              await ApiUser(Dio(BaseOptions(contentType: 'application/json')))
                  .posttoSV(authen, userCreate.toJson())
                  .then((value) {
            print("deobietduoc"+value.toString());
          }).catchError((Object obj) {
            switch (obj.runtimeType) {
              case DioError:
                final res = (obj as DioError).response;
                print("Got error : " +
                    res!.statusCode.toString() +
                    '->' +
                    res.statusMessage!);
                break;
              default:
                break;
            }
          });
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Page3(userRespone)));
        },
        child: Text('Regist'),
      ),
      appBar: AppBar(
        title: Text('Test Push Get'),
      ),
      body: Form(
          child: Column(
        children: [
          TextFormField(
            controller: username,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          Row(
            children: [
              Checkbox(
                  value: isactive,
                  onChanged: (value) {
                    setState(() {
                      isactive = value!;
                      print(isactive);
                    });
                  }),
              const Text('Active')
            ],
          ),
          ListTile(
            title: Text('Male'),
            leading: Radio(
                value: Sex.male,
                groupValue: sex,
                onChanged: (Sex? value) {
                  setState(() {
                    sex = value!;
                  });
                }),
          ),
          ListTile(
            title: Text('Female'),
            leading: Radio(
                value: Sex.female,
                groupValue: sex,
                onChanged: (Sex? value) {
                  setState(() {
                    sex = value!;
                  });
                }),
          ),
        ],
      )),
    );
  }
}

class Page3 extends StatelessWidget {
  final UserRespone userRespone;

  Page3(this.userRespone);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('UserResponeid: ' + userRespone.id.toString()),
      ),
    );
  }
}
