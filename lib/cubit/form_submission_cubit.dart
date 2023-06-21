import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'form_submission_state.dart';

class FormSubmissionCubit extends Cubit<FormSubmissionState> {
  FormSubmissionCubit() : super(FormSubmissionInitial());

  var datas;
  initLoad() async {
    try {
      emit(FormSubmissionLoading());

      var res = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
      log(res.body.toString(), name: 'api');
      datas = res.body;
      emit(FormSubmissionLoaded(data: datas));
    } catch (e) {
      emit(FormSubmissionError(error: e.toString()));
    }
  }

  submitButton() {
    emit(FormSubmissionLoading());

    datas = "button clicked";
    emit(FormSubmissionLoaded(data: datas));
  }
}
