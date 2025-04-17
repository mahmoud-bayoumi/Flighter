import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flighter/core/utils/stripe_keys.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

abstract class PaymentManager {
  static final Dio _dio = Dio();
  static String paymentIntentId = '';
  static int netAmount = 0;
  static Future<bool> makePayment(int amount, String currency) async {
    try {
      Map<String, dynamic> paymentData =
          await _getClientSecret((amount * 100).toString(), currency);
      await _initializePaymentSheet(paymentData['client_secret']);
      await Stripe.instance.presentPaymentSheet();
      // Store PaymentIntentId , amount here in DB
      paymentIntentId = paymentData['id'];
      double fee = ((0.029 * paymentData['amount']) + 0.30);

      netAmount = paymentData['amount'] - (50 + fee.toInt());
      return true;
    } catch (error) {
      log(error.toString());
      return false;
    }
  }

  static Future<void> _initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: clientSecret,
        merchantDisplayName: "Flighter",
      ),
    );
  }

  static Future<Map<String, dynamic>> _getClientSecret(
      String amount, String currency) async {
    var response = await _dio.post(
      'https://api.stripe.com/v1/payment_intents',
      options: Options(
        headers: {
          'Authorization': 'Bearer ${StripeKeys.secretKey}',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
      ),
      data: {
        'amount': amount,
        'currency': currency,
      },
    );

    return response.data;
  }

  static Future<bool> refundPayment(String paymentIntentId,
      {required int amount}) async {
    try {
      Map<String, dynamic> data = {
        'payment_intent': paymentIntentId,
        'amount': amount.toString()
      };

      var response = await _dio.post(
        'https://api.stripe.com/v1/refunds',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${StripeKeys.secretKey}',
            'Content-Type': 'application/x-www-form-urlencoded',
          },
        ),
        data: data,
      );
      paymentIntentId = '';
      netAmount = 0;
      return response.statusCode == 200;
    } catch (error) {
      return false;
    }
  }
}
/*
After Refund 
  Ticket will be deleted from database 

  Check if refund is possbile 

 */