import 'package:get/get.dart';

class Controller extends GetxController {
  int harcanankw = 0;

  int faturaLimit = 150;

  int extra = 0;

  int fatura150alti = 0;

  int fatura150ustu = 0;

  int toplamfatura = 0;

  kaydet(girilendeger) {
    print("object");
    harcanankw = int.tryParse(girilendeger.toString()) ?? 0;
    print("object1");
    extra = (harcanankw > faturaLimit) ? (harcanankw - faturaLimit) : 0;
    print("object2");
    fatura150alti = (((harcanankw - extra) * 1.37)  as double).toInt();
    print("object");
    fatura150ustu = (extra * 2.06).toInt();
    toplamfatura = (fatura150ustu + fatura150alti);


    print("$girilendeger");
    print("$toplamfatura");
    print("$extra");

    update();
  }
}
