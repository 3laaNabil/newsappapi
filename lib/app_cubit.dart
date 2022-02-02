import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:newsappapi/ApiHelper.dart';
import 'package:newsappapi/science.dart';

import 'Sports.dart';
import 'business.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

   List Screens = [
    Business(),
    Sports(),
    Science(),
  ];



  changeBottom(index){


    currentIndex = index;

    emit(ChangeBottomState());
  }


List <dynamic>  business = [];
  List <dynamic>  sports = [];

void  getBusiness()  {

     ApiHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'dd291070fd5c4851a12afe3df4dc329b',
      },
    ).then((value) {

      business = value.data['articles'];
      emit(GetDataState());
      print(business.length);
    }).catchError((e) {
      print('error getData ' + e.toString());

    });
  }
  void  getSports()  {

    ApiHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'dd291070fd5c4851a12afe3df4dc329b',
      },
    ).then((value) {

      sports = value.data['articles'];
      emit(GetDataState());
      print(sports.length);
    }).catchError((e) {
      print('error getData ' + e.toString());

    });
  }
  
  

}
