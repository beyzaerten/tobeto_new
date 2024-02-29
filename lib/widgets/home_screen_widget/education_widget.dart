// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_new/blocs/education/education_bloc.dart';
import 'package:tobeto_new/blocs/education/education_event.dart';
import 'package:tobeto_new/blocs/education/education_state.dart';
import 'package:tobeto_new/widgets/home_screen_widget/educational_card.dart';

class Educations extends StatelessWidget {
  const Educations({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Eğitimlerim",
        ),
      ),
      body:
          BlocBuilder<EducationBloc, EducationState>(builder: (context, state) {
        print("Departmenetttadadasd---  $state");
        if (state is EducationInitial) {
          print("Departmenettt  $state");

          context.read<EducationBloc>().add(FetchEducationRequested());
        }

        if (state is EducationLoading) {
          print("Departmenettt  $state");
        }

        if (state is EducationLoaded) {
          print(state.educationDepartmenogInfo.length);

          return ListView.builder(
            itemCount: state.educationDepartmenogInfo.length,
            itemBuilder: (context, index) => EducationalCard(
                department: state.educationDepartmenogInfo[index]),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
