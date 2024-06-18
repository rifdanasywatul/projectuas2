import 'package:flutter/material.dart';
import 'konfrimbayar.dart'; // Import halaman konfirmasi

class PaymentPage extends StatefulWidget {
  final Map<String, String> event;

  PaymentPage({required this.event});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF112C5A),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(),
          children: [
            Card(
              elevation: 5,
              color: Color(0xFF112C5A), // Warna biru untuk card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Pembayaran:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white), // Warna teks putih
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Event: ${widget.event['name']}',
                      style: TextStyle(fontSize: 16, color: Colors.white), // Warna teks putih
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Total Bayar: ${widget.event['price']}',
                      style: TextStyle(fontSize: 16, color: Colors.white), // Warna teks putih
                    ),
                    SizedBox(height: 10),
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pilih Metode Pembayaran:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Column(
              children: [
                PaymentMethodCard(
                  methodName: 'ShopeePay',
                  iconAsset: 'shopee.jpg',
                  value: 'ShopeePay',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                PaymentMethodCard(
                  methodName: 'GoPay',
                  iconAsset: 'gopay.jpg',
                  value: 'GoPay',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                PaymentMethodCard(
                  methodName: 'Dana',
                  iconAsset: 'dana.jpg',
                  value: 'Dana',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                PaymentMethodCard(
                  methodName: 'BNI',
                  iconAsset: 'BNI.jpg',
                  value: 'BNI',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                PaymentMethodCard(
                  methodName: 'BCA',
                  iconAsset: 'bca.jpg',
                  value: 'BCA',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
                PaymentMethodCard(
                  methodName: 'Mandiri',
                  iconAsset: 'mandiri.jpg',
                  value: 'Mandiri',
                  groupValue: selectedPaymentMethod,
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmationPage(event: widget.event),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF112C5A)),
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15, horizontal: 40)),
                ),
                child: Text(
                  'Bayar',
                  style: TextStyle(color: Colors.white, fontSize: 18), 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String methodName;
  final String iconAsset;
  final String value;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  PaymentMethodCard({
    required this.methodName,
    required this.iconAsset,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          onChanged(value);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
              Image.asset(
                iconAsset,
                width: 60,
                height: 40,
              ),
              SizedBox(width: 10),
              Text(
                methodName,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}