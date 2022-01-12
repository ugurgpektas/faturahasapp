import 'dart:html';
import 'dart:math';
import 'package:faturahasapp/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


final _formkey = GlobalKey<FormState>();




class HesaplamaSayfasi extends StatelessWidget {
  const HesaplamaSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Controller(),
      builder: (Controller c) => buildScaffold(c),
    );

  }

  Scaffold buildScaffold(Controller c) {print("asdasdas");
    return Scaffold(backgroundColor: Colors.white60,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            //autovalidateMode: AutovalidateMode.always,
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Title(
                  color: Colors.blueGrey,
                  child: const Text("2022 YILI ELEKTRİK FATURASI HESAPLAMA",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blueGrey)),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent.shade100),
                  //color: Colors.amberAccent,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  child: TextFormField(
                    //initialValue: 0.toString(),
                    validator: (deger) {
                      if (deger!.length < 2) {
                        return " LÜTFEN EN AZ 2 basamaklı DEGER GİRİNİZ ";
                      } else {
                        return null;
                      }
                    },

                    onSaved:(value)=>c.kaydet(value),
                    decoration: const InputDecoration(
                        hintText:
                        "Elektrik Tüketim miktarını Kwh olarak giriniz"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.orangeAccent.shade100),
                  //color: Colors.amberAccent,
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  child: TextButton(
                    onPressed: () {
                      bool _validation = _formkey.currentState!.validate();
                      if (_validation) {
                        _formkey.currentState!.save();
print("valide oldu");
                      }

                    },
                    child: const Text(
                      "HESAPLA",
                      textAlign: TextAlign.center,
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          //color: Colors.purple.shade200,
                          decoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child:  ListTile(
                            title: Text("TAHMİNİ ELEKTRİK FATURANIZ",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //color: Colors.purple.shade200,
                          decoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child:  ListTile(
                            title: Text("150 Kwh ' a kadar ${c.fatura150alti} TL",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        SizedBox(
                            height: 10
                        ),
                        Container(
                          //color: Colors.purple.shade200,
                          decoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child:  ListTile(
                            title: Text("150 Kwh aşan fiyat ${c.fatura150ustu} TL",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          //color: Colors.purple.shade200,
                          decoration: BoxDecoration(
                              color: Colors.purple.shade200,
                              borderRadius: BorderRadius.circular(20)),
                          child:  ListTile(
                            title: Text("TOPLAM FATURANIZ ${c.toplamfatura} TL",textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                          ),
                        ),

                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*  Kaydet() {
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();
    }
  }
}*/