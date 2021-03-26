// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kalkulator Profit',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Kalkulator Profit"),
          ),
          body: MyForm(),
        ));
  }
}

class MyForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  int totalKeuntungan, biayaProduksi, profit = 0;

  setResult(res) {
    setState(() {
      profit = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Isi total keuntungan disini",
                    labelText: "Total Keuntungan",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    totalKeuntungan = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ]),
              TextFormField(
                  decoration: InputDecoration(
                    hintText: "Isi biaya produksi disini",
                    labelText: "Biaya Produksi",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }

                    biayaProduksi = int.parse(value);
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ]),
              Container(
                margin: EdgeInsets.only(top: 8),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        int profit = totalKeuntungan - biayaProduksi;
                        setResult(profit);
                      }
                      ;
                    },
                    child: Text("Submit"),
                  ),)
              ),
              Container(
                margin: EdgeInsets.only(top: 80),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Result: Rp. ${profit},-"),
                ),
              )
            ],
          ),
        )
    );
  }
}
