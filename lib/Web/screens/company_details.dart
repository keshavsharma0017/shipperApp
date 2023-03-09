import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/Web/screens/home_web.dart';
import '/Widgets/liveasy_Icon_Widgets.dart';
import 'package:sizer/sizer.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String companyName;
  late String mailId;
  late String gstNumber;
  late String address;
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const LiveasyIcon(),
              Form(
                key: _formKey,
                child: Container(
                  width: 60.w,
                  height: isError?68.h:62.h,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 3.w,top: 5.h),
                        child: Text("Company Details",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 6.sp
                          ),
                        ),
                      ),//Company Details
                      SizedBox(height: 2.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 3.w,top: 5.h,right: 3.w),
                        child: Row(
                          children: [
                            Expanded(
                              flex:3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Company name",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 4.5.sp
                                    ),
                                  ),
                                  SizedBox(height: 1.9.h,),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Company Name',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                    validator: (value){
                                      if(value.toString().isEmpty){
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Enter your Company Name";
                                      }
                                      setState(() {
                                        isError = false;
                                      });
                                      return null;
                                    },
                                    onSaved: (value){
                                      companyName = value.toString();
                                    },
                                  ),
                                ],
                              ),
                            ),//Company Name
                            SizedBox(width: 2.w,),
                            Expanded(
                              flex:3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email Id",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 4.5.sp
                                    ),
                                  ),
                                  SizedBox(height: 1.9.h,),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter Your Email',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                    validator: (value){
                                      if(value.toString().isEmpty){
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Enter Email Id";
                                      }
                                      if(!value.toString().contains('@')||!value.toString().contains('.')){
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Invalid Email";
                                      }
                                      setState(() {
                                        isError = false;
                                      });
                                      return null;
                                    },
                                    onSaved: (value){
                                      mailId = value.toString();
                                    },
                                  ),
                                ],
                              ),
                            ),//Email Id
                          ],
                        ),
                      ),
                      SizedBox(height: 2.h,),
                      Padding(
                        padding: EdgeInsets.only(left: 3.w,top: 5.h,right: 3.w),
                        child: Row(
                          children: [
                            Expanded(
                              flex:3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("GST Number",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 4.5.sp
                                    ),
                                  ),
                                  SizedBox(height: 1.9.h,),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Enter GST Number',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                    validator: (value){
                                      if(value.toString().isEmpty){
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Enter your GST Number";
                                      }
                                      if(value.toString().length!=15){
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Invalid GST Number";
                                      }
                                      setState(() {
                                        isError = false;
                                      });
                                      return null;
                                    },
                                    onSaved: (value){
                                      gstNumber = value.toString();
                                    },
                                  ),
                                ],
                              ),
                            ),//GST Number
                            SizedBox(width: 2.w,),
                            Expanded(
                              flex:3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Address",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 4.5.sp
                                    ),
                                  ),
                                  SizedBox(height: 1.9.h,),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'Company Address',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                      ),
                                    ),
                                    validator: (value){
                                      if(value.toString().isEmpty){
                                        setState(() {
                                          isError = true;
                                        });
                                        return "Enter your Company Address";
                                      }
                                      setState(() {
                                        isError = false;
                                      });
                                      return null;
                                    },
                                    onSaved: (value){
                                      address = value.toString();
                                    },
                                  ),
                                ],
                              ),
                            ),//Address
                          ],
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),
                            backgroundColor: const Color(0xFF000066),
                            fixedSize: Size(28.w, 7.h),
                          ),
                          onPressed: (){
                            if(_formKey.currentState!.validate()){
                              _formKey.currentState!.save();
                              firebaseAuth.currentUser!.verifyBeforeUpdateEmail(mailId);
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreenWeb()));
                            }
                          },
                          child: Text('Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize: 4.3.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
