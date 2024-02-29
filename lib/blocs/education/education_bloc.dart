import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/education/education_event.dart';
import 'package:tobeto_new/blocs/education/education_state.dart';
import 'package:tobeto_new/repository/education_repository.dart';

class EducationBloc extends Bloc<EducationEvent, EducationState> {
  EducationBloc() : super(EducationInitial()) {
    on<FetchEducationRequested>((event, emit) async {
      try {
        final departmentInfo =
            await EducationRepository().getDepartmentInfoFromFirebase();
        print(departmentInfo.lessonList);
        emit(EducationLoaded(
            educationDepartmenogInfo: departmentInfo.lessonList));
      } catch (e) {
        emit(EducationError());
        print("DepartmentError FetchDepartmentRequested erorrrr");
        print(e);
      }
    });

    on<ResetEducationEvent>((event, emit) async {
      try {
        emit(EducationInitial());
      } catch (e) {
        emit(EducationError());
        print("DepartmentError ResetDepartmentEvent erorrrr");
        print(e);
      }
    });
  }
}
