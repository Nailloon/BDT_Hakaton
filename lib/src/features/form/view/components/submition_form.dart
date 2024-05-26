import 'package:bdt_hakaton/src/features/form/bloc/loading_bloc.dart';
import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SumbitionForm extends StatefulWidget {
  const SumbitionForm({super.key});

  @override
  State<SumbitionForm> createState() => _SumbitionFormState();
}

class _SumbitionFormState extends State<SumbitionForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: textEditingController,
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
                  return "Введите URL";
                } else if (!RegExp(
                        r'^https?:\/\/(?:www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b(?:[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)$')
                    .hasMatch(value)) {
                  return "Введите корректный URl";
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
                      _formKey.currentState?.save();
                      final String url = textEditingController.text;
                      context.read<LoadingBloc>().add(LoadURLsEvent([url]));
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
                'Отправить на проверку',
                style: _formKey.currentState?.validate() == true
                    ? Theme.of(context).textTheme.bodyLarge : Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ],
        ));
  }
}
