import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappapi/home.dart';

import 'app_cubit.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit, AppState>(


      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ListView.builder(
          itemBuilder: (context, index) => buildNewsItem(AppCubit().get(context).business[index]),

          itemCount: AppCubit().get(context).business.length,
        );
      },
    );
  }
}
