// payment_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'payment_view_model.dart';

class PaymentView extends StatelessWidget {
  final PaymentViewModel viewModel = Get.put(PaymentViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<PaymentViewModel>(
              builder: (controller) {
                if (controller.applePayConfig.value == null) {
                  return const CircularProgressIndicator();
                } else {
                  return ApplePayButton(
                    paymentConfiguration: controller.applePayConfig.value!,
                    paymentItems: controller.paymentModel.paymentItems,
                    style: ApplePayButtonStyle.black,
                    type: ApplePayButtonType.buy,
                    margin: const EdgeInsets.only(top: 15.0),
                    onPaymentResult: controller.onApplePayResult,
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            GetX<PaymentViewModel>(
              builder: (controller) {
                if (controller.googlePayConfig.value == null) {
                  return const CircularProgressIndicator();
                } else {
                  return GooglePayButton(
                    paymentConfiguration: controller.googlePayConfig.value!,
                    paymentItems: controller.paymentModel.paymentItems,
                    type: GooglePayButtonType.buy,
                    margin: const EdgeInsets.only(top: 15.0),
                    onPaymentResult: controller.onGooglePayResult,
                    loadingIndicator: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
