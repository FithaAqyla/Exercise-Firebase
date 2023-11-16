import 'dart:math';
import 'package:cloud/model/contact_model.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group("contact model", () {
    test("add contact", () {
      final map = <String, dynamic>{
        'name': 'ana',
        'phone': '0872372637',
        'email': 'ana@gmail.com',
        'address': 'Bantul',
      };

      final result = ContactModel.fromMap(map);
      expect(result, isA<ContactModel>());

      expect(result.name, 'ana');
      expect(result.phone, '0872372637');
      expect(result.email, 'ana@gmail.com');
      expect(result.address, 'Bantul');
    });
    test("update contact", () {
      final initial = <String, dynamic>{
        'name': 'ana',
        'phone': '0872372637',
        'email': 'ana@gmail.com',
        'address': 'Bantul',
      };
      final map = <String, dynamic>{
        'name': 'anna',
        'phone': '087237283782',
        'email': 'anna@gmail.com',
        'address': 'Bantul',
      };

      final result = ContactModel.fromMap(initial);
      final upd = ContactModel.fromMap(map);

      expect(result, isA<ContactModel>());
      expect(result.name, 'ana');
      expect(result.phone, '0872372637');
      expect(result.email, 'ana@gmail.com');
      expect(result.address, 'Bantul');

      expect(upd, isA<ContactModel>());
      expect(upd.name, 'anna');
      expect(upd.phone, '087237283782');
      expect(upd.email, 'anna@gmail.com');
      expect(upd.address, 'Bantul');
    });
    // test("delete", () {
    //   final dell = <String, dynamic>{
    //     'name': 'anna',
    //     'phone': '087237283782',
    //     'email': 'anna@gmail.com',
    //     'address': 'Bantul',
    //   };
    //   final result = ContactModel.fromMap(dell);
    //   expect(result, isA<ContactModel>());
    //   expect(result.id, '');
    //   expect(result.name, '');
    //   expect(result.phone, '');
    //   expect(result.email, '');
    //   expect(result.address, '');
    // });
  });
}
