import 'dart:ffi';

import 'package:book_now/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    User? user = FirebaseAuth.instance.currentUser;
    UserModel loggedInUser = UserModel();



    final _formkey = GlobalKey<FormState>();

  final TextEditingController SearchController = new TextEditingController();


    @override
    void initState() {
      super.initState();
      FirebaseFirestore.instance
      .collection("users")
      .doc(user!.uid)
      .get()
      .then((value) {
        this.loggedInUser = UserModel.fromMap(value.data());
        setState(() {});
      });
    }

  @override
  Widget build(BuildContext context) {

     final searchField = TextFormField(
      autofocus: false,
      controller: SearchController,
      keyboardType: TextInputType.emailAddress,

      onSaved: (value)
      {
        SearchController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.domain),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Domain Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),);

          final bookButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: () {},
        child: Text("Book Domain", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
        ),),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome ${loggedInUser.firstName} ${loggedInUser.secondName}"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 25,),

              searchField,

              SizedBox(height: 25,),

              bookButton,

              SizedBox(height: 15,)

              
            ],
          ),
        ),
      ),
    );
  }
}