import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit.dart';
import 'home.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<AppCubit, AppState>(


      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => buildNewsItem(AppCubit().get(context).sports[index]),

          itemCount: AppCubit().get(context).sports.length,
        );
      },
    );
  }
}
