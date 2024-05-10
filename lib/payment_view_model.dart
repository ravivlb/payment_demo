// payment_view_model.dart
import 'package:get/get.dart';
import 'package:pay/pay.dart';
import 'payment_model.dart';

class PaymentViewModel extends GetxController {
  late PaymentModel paymentModel;
  late Rx<PaymentConfiguration?> applePayConfig;
  late Rx<PaymentConfiguration?> googlePayConfig;

  PaymentViewModel() {
    applePayConfig = Rx<PaymentConfiguration?>(null);
    googlePayConfig = Rx<PaymentConfiguration?>(null);
  }

  @override
  void onInit() {
    super.onInit();
    _loadPaymentModel();
    _loadApplePayConfig();
    _loadGooglePayConfig();
  }

  void _loadPaymentModel() {
    paymentModel = PaymentModel(
      paymentItems: [
        const PaymentItem(
          label: 'Total',
          amount: '1.00',
          status: PaymentItemStatus.final_price,
        )
      ],
    );
  }

  void _loadApplePayConfig() async {
    applePayConfig.value =
        await PaymentConfiguration.fromAsset('apple_pay_config.json');
  }

  void _loadGooglePayConfig() async {
    googlePayConfig.value =
        await PaymentConfiguration.fromAsset('google_pay_config.json');
  }

  void onApplePayResult(dynamic paymentResult) {
    // Send the resulting Apple Pay token to your server / PSP
     Get.snackbar(
      'Apple Pay Result',
      'Payment result: $paymentResult',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onGooglePayResult(dynamic paymentResult) {
    // Send the resulting Google Pay token to your server / PSP
    Get.snackbar(
      'Google Pay Result',
      'Payment result: $paymentResult',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
