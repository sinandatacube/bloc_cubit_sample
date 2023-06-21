import 'package:bloc_sample/cubit/form_submission_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// import 'cubit/form_submission_cubit.dart';
// import 'package:bloc/bloc.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => FormSubmissionCubit()..initLoad(),
                        child: Second(),
                      )));
            },
            child: Text("dada")),
      ),
    );
  }
}

class Second extends StatelessWidget {
  const Second({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<FormSubmissionCubit, FormSubmissionState>(
      builder: (context, state) {
        if (state is FormSubmissionError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is FormSubmissionLoaded) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.data.toString()),
                TextButton(
                    onPressed: () {
                      context.read<FormSubmissionCubit>().submitButton();
                    },
                    child: Text("click me"))
              ],
            ),
          );
        }
        if (state is FormSubmissionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SizedBox.shrink();
      },
    ));
  }
}

// MaterialPageRoute(
//                       builder: (context) => BlocProvider(
//                           create: (context) => ShowroomCubit(
//                               apiRepository: context.read<ApiRepository>(),
//                               internetRepository:
//                                   context.read<InternetRepository>())
//                             ..loadShowroomDetails(
//                                 id: details.detail.showRoomId),
//                           child: const ShowroomDetailScreen()),
//                     ),
//                   );
