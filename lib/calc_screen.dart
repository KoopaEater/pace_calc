import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalcScreen extends StatelessWidget {
  CalcScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final _timeTextField = TextEditingController();
  final _percentTextField = TextEditingController();
  final _resultTextField = TextEditingController();
  final RegExp _decimalNumber = RegExp(r'^\d*([.,]\d+)?$');

  String? _validDecimal(String? value) {
    if (value == null || value.isEmpty) {
      return "Skriv venligst et tal";
    }
    if (!_decimalNumber.hasMatch(value)) {
      return "Skriv venligst et gyldigt tal.";
    }
    return null;
  }

  double _parseDouble(String str) {
    final formattedStr = str.replaceAll(',', '.');
    return double.parse(formattedStr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pace Calculator"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: SizedBox(
            width: 300.0,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          controller: _timeTextField,
                          textAlign: TextAlign.end,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Tid (PR)",
                          ),
                          validator: (value) {
                            return _validDecimal(value);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: const Text("sek"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextFormField(
                          controller: _percentTextField,
                          textAlign: TextAlign.end,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Procentvis hastighed",
                          ),
                          validator: (value) {
                            return _validDecimal(value);
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Expanded(
                        flex: 2,
                        child: const Text("%"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final double t = _parseDouble(_timeTextField.text);
                        final double p = _parseDouble(_percentTextField.text);
                        final String res = ((t*100)/p).toStringAsFixed(2);
                        _resultTextField.text = res;
                      }
                    },
                    child: const Text("Udregn"),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextField(
                          controller: _resultTextField,
                          readOnly: true,
                          textAlign: TextAlign.end,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Ny tid",
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      const Expanded(
                        flex: 2,
                        child: Text("sek"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
