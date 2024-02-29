import 'package:tobeto_new/models/education_model.dart';

abstract class EducationState {}

class EducationInitial extends EducationState {}

class EducationLoading extends EducationState {}

class EducationLoaded extends EducationState {
  final List<EducationtLessonModel> educationDepartmenogInfo;
  EducationLoaded({
    required this.educationDepartmenogInfo,
  });
}

class EducationError extends EducationState {}
