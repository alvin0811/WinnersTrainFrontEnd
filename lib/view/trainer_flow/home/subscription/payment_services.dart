// import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

// class PaymentServices {
//   Future<bool?> makePayment(String clientSecret) async {
//     try {
//       await Stripe.instance.initPaymentSheet(
//         paymentSheetParameters: SetupPaymentSheetParameters(
//           paymentIntentClientSecret: clientSecret, 
//           style: ThemeMode.light,
//           merchantDisplayName: 'Your Merchant Name',
//         ),
//       );

      
//       return await displayPaymentSheet();
//     } catch (err) {
//       throw Exception("Error initializing payment sheet: $err");
//     }
//   }

//   Future<bool?> displayPaymentSheet() async {
//     try {
   
//       await Stripe.instance.presentPaymentSheet();
//       return true; // Payment successful
//     } on StripeException catch (e) {
//       throw Exception("Error during payment: ${e}");
//     } catch (e) {
//       throw Exception("Error: $e");
//     }
//   }
// }
