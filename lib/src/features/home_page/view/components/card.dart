import 'dart:math';

import 'package:bdt_hakaton/src/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PurpleCard extends StatelessWidget {
  final String imageName;
  final String text;
  final String buttonText;
  final VoidCallback action;

  const PurpleCard({
    super.key,
    required this.imageName,
    required this.text,
    required this.buttonText,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxHeight = constraints.maxHeight;

        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Card(
            color: AppColors.purple,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(36.0),
                    child: Image.asset(
                      imageName,
                      height: MediaQuery.of(context).size.height / 2,
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Expanded(
                    child: Text(
                        text,
                        style: Theme.of(context).textTheme.displaySmall,
                        
                      ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: action,
                      child: Text(buttonText, style: Theme.of(context).textTheme.bodyLarge,),
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size.fromHeight(32.0),
                        ),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(AppColors.brightOrange),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(AppColors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}