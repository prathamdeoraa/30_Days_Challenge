// import 'package:firebase/Uihelper/UiHelper.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class Phonepage extends StatefulWidget {
//   const Phonepage({super.key});

//   @override
//   State<Phonepage> createState() => _PhonepageState();
// }

// class _PhonepageState extends State<Phonepage> {
//   final phonenumber = TextEditingController();
//   final otpController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: Text(
//           "Login by Phone",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//         ),
//       ),

//       body: Column(
//         children: [
//           //TextField - PhoneNumber
//           Padding(
//             padding: const EdgeInsets.all(16),
//             child: TextField(
//               controller: phonenumber,
//               keyboardType: TextInputType.numberWithOptions(),
//               decoration: InputDecoration(
//                 hintText: 'Phone number',
//                 labelText: 'Mobile Number',
//                 prefix: Text('+91 - '),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//             ),
//           ),

//           //Button - Login
//           UiHelper.CustomButton(
//             () async {
//               await FirebaseAuth.instance.verifyPhoneNumber(
//                 verificationCompleted: (PhoneAuthCredential phonecred) {},
//                 verificationFailed: (FirebaseAuthException ex) {},
//                 codeSent: (String verificationid, int? resendtoken) {
//                   AlertBox(context, verificationid);
//                 },
//                 codeAutoRetrievalTimeout: (String verificationid) {},
//                 phoneNumber: "+91${phonenumber.text.toString()}",
//               );
//             },
//             "Login",
//             MediaQuery.sizeOf(context).width * 0.8,
//           ),
//         ],
//       ),
//     );
//   }

//   // Future<void> login() async {
//   //   UserCredential? usercred;

//   //   if (usercred == '') {
//   //     return UiHelper.AlerBox(context, "Enter Phone Number");
//   //   } else {
//   //     try {
//   //       // usercred = await FirebaseAuth.instance.signInWithPhoneNumber(
//   //       //   phonenumber.text,
//   //       // );
//   //     } on FirebaseAuthException catch (ex) {}
//   //   }
//   // }

//   AlertBox(BuildContext context, String verificationid) {
//     return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text("OTP Validation"),

//           content: TextField(
//             controller: otpController,
//             decoration: InputDecoration(hintText: "Enter OTP"),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () async {
//                 try {
//                   PhoneAuthCredential phonecred = PhoneAuthProvider.credential(
//                     verificationId: verificationid,
//                     smsCode: otpController.text.toString(),
//                   );
//                   FirebaseAuth.instance.signInWithCredential(phonecred).then((
//                     value,
//                   ) {
//                     Navigator.pushNamedAndRemoveUntil(
//                       context,
//                       '/dashboard',
//                       (context) => false,
//                     );
//                   });
//                 } catch (ex) {
//                   print(ex.toString());
//                 }
//               },
//               child: Text('Verify'),
//             ),
//             TextButton(onPressed: () {}, child: Text('Resend OTP')),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:firebase/Uihelper/UiHelper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phonepage extends StatefulWidget {
  const Phonepage({super.key});

  @override
  State<Phonepage> createState() => _PhonepageState();
}

class _PhonepageState extends State<Phonepage> {
  final phonenumber = TextEditingController();
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Login by Phone",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          // Phone Number Input
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: phonenumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Phone number',
                labelText: 'Mobile Number',
                prefix: const Text('+91 '),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          // Login Button
          UiHelper.CustomButton(
            () async {
              print('login pressed');

              if (phonenumber.text.trim().length != 10) {
                UiHelper.AlerBox(context, "Enter valid 10-digit phone number");
                return;
              }

              String number = phonenumber.text.trim();

              await FirebaseAuth.instance.verifyPhoneNumber(
                phoneNumber: '+91$number',
                verificationCompleted: (PhoneAuthCredential phonecred) {},
                verificationFailed: (FirebaseAuthException ex) {
                  (FirebaseAuthException ex) {
                    print("❌ OTP sending failed: ${ex.message}");
                    UiHelper.AlerBox(context, ex.message.toString());
                  };

                  UiHelper.AlerBox(context, ex.message.toString());
                },
                codeSent: (String verificationid, int? resendtoken) {
                  print("✅ OTP sent successfully to +91${phonenumber.text}");
                  print("verificationId: $verificationid");
                  AlertBox(context, verificationid);
                },
                codeAutoRetrievalTimeout: (String verificationid) {},
              );
            },
            "Login",
            MediaQuery.sizeOf(context).width * 0.8,
          ),
        ],
      ),
    );
  }

  // OTP Dialog
  Future AlertBox(BuildContext context, String verificationid) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("OTP Verification"),
          content: TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(hintText: "Enter OTP"),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential phonecred = PhoneAuthProvider.credential(
                    verificationId: verificationid,
                    smsCode: otpController.text.trim(),
                  );

                  await FirebaseAuth.instance
                      .signInWithCredential(phonecred)
                      .then((value) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/dashboard',
                          (route) => false,
                        );
                      });
                } catch (ex) {
                  UiHelper.AlerBox(context, ex.toString());
                }
              },
              child: const Text('Verify'),
            ),
            TextButton(
              onPressed: () {
                // TODO: Implement resend logic if needed
              },
              child: const Text('Resend OTP'),
            ),
          ],
        );
      },
    );
  }
}
