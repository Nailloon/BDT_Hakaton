import 'package:bdt_hakaton/src/features/form/view/components/submition_form.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Center(child: SizedBox(height: 400, width: MediaQuery.of(context).size.width/2,child: SumbitionForm()))));
  }
}