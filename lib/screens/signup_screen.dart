import 'package:book_now/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final _formKey = GlobalKey<FormState>();

  final firstNameEditingController = new TextEditingController();
  final secondNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {


        final firstNameField = TextFormField(
      autofocus: false,
      controller: firstNameEditingController,
      keyboardType: TextInputType.emailAddress,
            validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Full name is cannot be empty!!!");
        }

        if (!regex.hasMatch(value)) {
          return ("Enter valid name (Min. 3 characters");
        }
        return null;
      },
      onSaved: (value)
      {
        firstNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Your First Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),);

          final secondNameField = TextFormField(
      autofocus: false,
      controller: secondNameEditingController,
      keyboardType: TextInputType.emailAddress,
              validator: (value) {
        RegExp regex = new RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("second name cannot be empty!!!");
        }

        if (!regex.hasMatch(value)) {
          return ("Enter valid name (Min. 6 characters");
        }
        return null;
      },
      onSaved: (value)
      {
        secondNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Your Second Name",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),);

             final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
       validator: (value) {
        if (value!.isEmpty) 
        {
          return ("Please enter your email");
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Please enter a valid Email");
        }    
        return null;    
      },
      onSaved: (value)
      {
        emailEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.mail),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Your Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),);

             final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        RegExp regex = new RegExp(r'^.{6,}$');
        if (value!.isEmpty) {
          return ("Your password is needed for login!!!");
        }

        if (!regex.hasMatch(value)) {
          return ("Enter valid password (Min. 6 characters");
        }
      },
      onSaved: (value)
      {
        passwordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Your Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),);

             final confirmPasswordField = TextFormField(
      autofocus: false,
      controller: confirmPasswordEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value)
      {
        if (confirmPasswordEditingController.text.length > 6 && passwordEditingController.text != value) {
          return ("Passwords don't match");
        }
        return null;
      },
      onSaved: (value)
      {
        confirmPasswordEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.vpn_key),
        contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Confirm your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
      ),);

          final signupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.greenAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,

        onPressed: () {},
        child: Text("SignUp", textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold
        ),),
      ),
    );

       return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.greenAccent,),
          onPressed: () {
            Navigator.of(context).pop();
          }
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    SizedBox(height: 75,), 
                    
                    firstNameField,
                    SizedBox(height: 25,),

                    secondNameField,
                    SizedBox(height: 25,),

                    emailField,
                    SizedBox(height: 25,),

                    passwordField,
                    SizedBox(height: 25,),

                    confirmPasswordField,
                    SizedBox(height: 25,),

                        signupButton,
                    SizedBox(height: 15,),
                 

                     Row(

                       mainAxisAlignment: MainAxisAlignment.center,

                       children: <Widget>[
                         Text("Already have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                            },
                            child: Text("Login", style: TextStyle(
                              fontWeight : FontWeight.w900, fontSize: 15, color: Colors.greenAccent),
                            ),
                          )
                       ],
                     )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signUp(String email, String password) async {
    if(_formKey.currentState!.validate())
    {
      
    }
  }
}