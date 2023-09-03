import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOtp extends StatefulWidget {
  const MyOtp({super.key});

  @override
  State<MyOtp> createState() => _MyOtpState();
}

class _MyOtpState extends State<MyOtp> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(218, 225, 216, 1.0)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, "phone", (route) => false);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 25,right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/img2.png",
                height: 250,
                width: 250,
              ),
              SizedBox(height: 25,),


              Text("Enter OTP", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              Text("We need to register your phone number before getting started !",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20,),

          Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: focusedPinTheme,
            submittedPinTheme: submittedPinTheme,
            validator: (s) {
              return s == '2222' ? null : 'Pin is incorrect';
            },
            pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
            showCursor: true,
            onCompleted: (pin) => print(pin),
          ),

              SizedBox(height: 20,),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {}, child: Text("Get Started"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green.shade600, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                ),
              ),
              TextButton(onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, "phone", (route) => false);
              }, child: Text("Did not get OTP, resend ?" , style: TextStyle(color: Colors.black),))
            ],
          ),
        ),
      ),
    );
  }
}
