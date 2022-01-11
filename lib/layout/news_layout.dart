import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/layout/cubit/cubit.dart';
import 'package:news_app_test/layout/cubit/states.dart';
import 'package:news_app_test/modules/search/search.dart';
import 'package:news_app_test/shared/components/componets.dart';
import 'package:news_app_test/shared/cubit/cubit.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    navigateTo(context, SearchScreen(),);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                ),
              ],
              title: Text('News App'),
            ),
            body: cubit.listScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bottomItem,
              selectedItemColor: Colors.black,
              currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.shifting,
              onTap: (value) {
                cubit.changeBottomNav(value);

              },
            ),
          );
        },
      );
  }
}
