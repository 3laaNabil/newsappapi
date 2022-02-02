import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsappapi/Sports.dart';
import 'package:newsappapi/app_cubit.dart';
import 'package:newsappapi/business.dart';
import 'package:newsappapi/science.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getBusiness()..getSports(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.deepOrange,
              title: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance),
                  SizedBox(
                    width: 2,
                  ),
                  Text("News"),
                ],
              )),
              elevation: 0,
            ),
            body: AppCubit().Screens[AppCubit().get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.deepOrange,
              selectedItemColor: Colors.white,
              currentIndex: AppCubit().get(context).currentIndex,
              onTap: (index) => AppCubit().get(context).changeBottom(index),
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business), title: Text("business")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), title: Text("sports")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science), title: Text("science")),
              ],
            ),
          );
        },
      ),
    );
  }
}

Widget buildNewsItem(model) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: InkWell(
      onTap: () {},
      child: Card(
        elevation: 5,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.deepOrange)),
        child: Row(
          children: [
            Image.network(
              "${model['urlToImage']}",
              width: 150,
              height: 150,
            ),
            Expanded(
              child: Column(
                children:  [
                  Text(" ${model['title']} ",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.deepOrange,
                      )),
                  Text("${model['publishedAt']}",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
