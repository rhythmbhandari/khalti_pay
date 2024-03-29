import 'package:flutter/material.dart';
import 'package:flutter_khalti/flutter_khalti.dart';

class PayPage extends StatefulWidget {
  PayPage({key}) : super(key: key);

  @override
  _PayPageState createState() => _PayPageState();
}

int _value;

class _PayPageState extends State<PayPage> {
  final List<int> priceList = <int>[100, 200, 500, 1000];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Khalti Pay"), backgroundColor: Colors.purple[900]),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Container(
                child: DropdownButton(
                  value: _value,
                  items: priceList.map((int item) {
                    return DropdownMenuItem<int>(
                      child: Text('Rs $item'),
                      value: item,
                    );
                  }).toList(),
                  hint: Text(
                    "Please choose the required amount",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  onChanged: (int value) {
                    setState(() {
                      _value = value;
                    });
                  },
                ),
              ),
              SizedBox(
                width: 120.0,
                height: 20.0,
                child: ElevatedButton(
                  child: Text('Pay'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.purple[900]),
                  ),
                  onPressed: () {
                    _payKhalti(context);
                  },
                ),
              ),
            ])));
  }
}

_payKhalti(BuildContext context) {
  /// Paisa to Rupees
  double amount = _value.toDouble() * 100;

  FlutterKhalti _flutterKhalti = FlutterKhalti.configure(
      //Need Public key from mercant account
      publicKey: "test_public_key_2132u31982312312",
      urlSchemeIOS: "KhaltiPayFlutterSchema");

  KhaltiProduct product =
      KhaltiProduct(id: "HEHE", name: "Testing Payment", amount: amount);

  _flutterKhalti.startPayment(
      product: product,
      onSuccess: (data) {
        print('Payment Successful');
      },
      onFaliure: (error) {
        print("Payment Failed");
      });
}
