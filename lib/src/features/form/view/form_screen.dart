import 'package:bdt_hakaton/src/features/form/bloc/loading_bloc.dart';
import 'package:bdt_hakaton/src/features/form/view/components/submition_form.dart';
import 'package:bdt_hakaton/src/features/form/view/loading_screen.dart';
import 'package:bdt_hakaton/src/features/stats/view/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
                child: SizedBox(
                    height: 400,
                    width: MediaQuery.of(context).size.width / 2,
                    child: BlocProvider(
                      create: (context) => LoadingBloc(urlsForApp: []),
                      child: BlocBuilder<LoadingBloc, LoadingState>(
                        builder: (context, state) {
                          if (state is LoadingInitial)
                          return SumbitionForm();
                          if (state is LoadingCompleted)
                          return StatsScreen(stats: state.urlModels, isNeedPlots: state.isNeedPlot, imageBase64String: state.image,);
                          if (state is LoadingInProgress)
                          return LoadingScreen();
                          if (state is LoadingFailure)
                          return Center(child: Column(children:[ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text("Что-то пошло не так"))]));
                          else{
                            return Container();
                          }
                        },
                      ),
                    )))));
  }
}
