import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cats/presentation/blocs/cat_fact_history/bloc/cat_fact_history_bloc.dart';
import 'package:random_cats/presentation/utils/app_colors.dart';

class CatFactsHistory extends StatelessWidget {
  const CatFactsHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatFactHistoryBloc, CatFactHistoryState>(
      builder: (context, state) {
        if (state is CatFactHistoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CatFactHistorySuccess) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Facts History'),
              backgroundColor: AppColors.cardBgColor,
              leading: GestureDetector(
                child: const Icon(Icons.arrow_back_ios_new),
                onTap: () {
                  // injector.get<HiveInterface>().box('facts').clear();
                  Navigator.pop(context);
                },
              ),
            ),
            body: ListView.builder(
              itemCount: state.catModels.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    color: AppColors.cardBgColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${state.catModels[index].fact}",
                        style: const TextStyle(
                            fontSize: 16, color: AppColors.textColor),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
          child: Text('Empty screen'),
        );
      },
    );
  }
}
