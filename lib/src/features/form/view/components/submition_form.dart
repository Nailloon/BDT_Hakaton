import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SumbitionForm extends StatefulWidget {
  const SumbitionForm({super.key});

  @override
  State<SumbitionForm> createState() => _SumbitionFormState();
}

class _SumbitionFormState extends State<SumbitionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: textEditingControllerEmail,
              onChanged: (val) {
                _formKey.currentState?.validate();
                setState(() {});
              },
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                icon: const Icon(Icons.web),
                label: const Text("URL"),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.brightOrange)),
                iconColor: _formKey.currentState?.validate() == true
                    ? AppColors.purple
                    : AppColors.brightOrange,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.purple)),
                hintText: "http or https...",
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.lightGrey)),
                    
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter url";
                } else if (!RegExp(
                        r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$')
                    .hasMatch(value)) {
                  return "Please Enter a Valid url";
                }
                return null;
              },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: _formKey.currentState?.validate() == true
                  ? () {
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    }
                  : null,
              style: ButtonStyle(
                minimumSize:
                    const MaterialStatePropertyAll<Size>(Size.square(32)),
                backgroundColor: _formKey.currentState?.validate() == true
                    ? MaterialStateProperty.all<Color>(AppColors.purple)
                    : MaterialStateProperty.all<Color>(AppColors.lightGrey),
              ),
              child: Text(
                'Submit',
                style: _formKey.currentState?.validate() == true
                    ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ));
  }
}
