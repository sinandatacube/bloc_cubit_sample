part of 'form_submission_cubit.dart';

class FormSubmissionState extends Equatable {
  const FormSubmissionState();

  @override
  List<Object> get props => [];
}

class FormSubmissionInitial extends FormSubmissionState {}

class FormSubmissionLoaded extends FormSubmissionState {
  var data;
  FormSubmissionLoaded({required this.data});
}

class FormSubmissionLoading extends FormSubmissionState {}

class FormSubmissionError extends FormSubmissionState {
  final String error;
  FormSubmissionError({required this.error});
}
