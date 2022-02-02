import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappapi/app_cubit.dart';

import 'home.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(


      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => buildNewsItem(AppCubit().get(context).business[index]),

          itemCount: AppCubit().get(context).business.length,
        );
      },
    )
    ;
  }
}
