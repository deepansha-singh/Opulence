import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:opulence/constant/Colors.dart';
import 'package:opulence/constant/FirebaseReferances.dart';
import 'package:opulence/widgets/loginpage.dart';

class CategoryAdd extends StatefulWidget {
  const CategoryAdd({Key? key}) : super(key: key);

  @override
  _CategoryAddState createState() => _CategoryAddState();
}

class _CategoryAddState extends State<CategoryAdd> {
  var colorchoosen;
  TextEditingController _title = new TextEditingController();
  TextEditingController _allowance = new TextEditingController();
  String? selectedColorcode;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: constraints.maxHeight * 0.02,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    alignment: Alignment.topLeft,
                    height: constraints.maxHeight * 0.23,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/opulence-png.png',
                          height: constraints.maxHeight * 0.2,
                          width: constraints.maxWidth * 0.3,
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          width: constraints.maxWidth * 0.02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: constraints.maxHeight * 0.09,
                            ),
                            Container(
                              height: constraints.maxHeight * 0.05,
                              width: constraints.maxWidth * 0.5,
                              child: Text(
                                'Add Category',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Myriad',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: constraints.maxWidth * 0.9,
                      child: TextFormField(
                        style: TextStyle(
                          fontFamily: 'Myriad',
                        ),
                        validator: (val) {
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(5.0),
                          icon: Padding(
                            padding:
                                const EdgeInsets.only(left: 2.0, right: 0.0),
                            child: Icon(
                              Icons.category,
                              color: Colors.grey,
                              size: 25,
                            ),
                          ),
                          labelText: 'Category title',
                          labelStyle: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Myriad',
                          ),
                        ),
                        controller: _title,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          child: InkWell(
                            onTap: () {
                              print("here we are");
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text("Choose Colour!"),
                                        content: Wrap(
                                          children: colors
                                              .map((e) => InkWell(
                                                    onTap: () {
                                                      final value =
                                                          e as MaterialColor;
                                                      final data = value
                                                          .toString()
                                                          .split(
                                                              "primary value:");
                                                      final newdata = data[1]
                                                          .trim()
                                                          .split("(");
                                                      final colorshade =
                                                          newdata[1]
                                                              .trim()
                                                              .split("))");
                                                      print(colorshade[0]);
                                                      selectedColorcode =
                                                          colorshade[0];
                                                      colorchoosen = Color(
                                                          int.parse(
                                                              colorshade[0]));
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: CircleAvatar(
                                                        backgroundColor: e,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                        ),
                                      ));
                            },
                            child: TextFormField(
                              style: TextStyle(
                                fontFamily: 'Myriad',
                              ),
                              validator: (val) {
                                return null;
                              },
                              enabled: false,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(5.0),
                                icon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 0.0),
                                  child: Icon(
                                    Icons.color_lens_outlined,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                                labelText: 'Colour',
                                labelStyle: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Myriad',
                                    color: colorchoosen ?? Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                          width: constraints.maxWidth * 0.4,
                          child: TextFormField(
                            style: TextStyle(
                              fontFamily: 'Myriad',
                            ),
                            validator: (val) {
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(5.0),
                              icon: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 0.0),
                                child: Icon(
                                  Icons.monetization_on_sharp,
                                  color: Colors.grey,
                                  size: 25,
                                ),
                              ),
                              labelText: 'Allowance',
                              labelStyle: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Myriad',
                              ),
                            ),
                            controller: _allowance,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade400,
                    ),
                    child: TextField(
                      maxLines: 6,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(5.0),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Myriad',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          alignment: Alignment.center,
                          primary: Color(0xFF3C2415),
                          padding: EdgeInsets.all(20),
                          elevation: 10,
                          minimumSize: Size(constraints.maxWidth * 0.7,
                              constraints.maxHeight * 0.02),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                        ),
                        onPressed: () async {
                          final key = categoryReference.push().key;
                          categoryReference.child(key).update({
                            "title": _title.text,
                            "allowance": _allowance.text.toString(),
                            "ColorCode": selectedColorcode,
                            "timestamp": DateTime.now().toIso8601String(),
                          });
                        },
                        child: Text(
                          'Confirm',
                          style: TextStyle(
                            fontFamily: 'Myriad',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFF275),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
