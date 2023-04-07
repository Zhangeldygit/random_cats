import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_cats/network/injector.dart';
import 'package:random_cats/presentation/blocs/cat_fact/cat_fact_bloc.dart';
import 'package:random_cats/presentation/blocs/cat_fact_history/bloc/cat_fact_history_bloc.dart';
import 'package:random_cats/presentation/ui/cat_facts_history.dart';
import 'package:random_cats/presentation/utils/app_colors.dart';

class CatFacts extends StatefulWidget {
  const CatFacts({Key? key}) : super(key: key);

  @override
  State<CatFacts> createState() => _CatFactsState();
}

class _CatFactsState extends State<CatFacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat Facts'),
        backgroundColor: AppColors.cardBgColor,
      ),
      body: BlocBuilder<CatFactBloc, CatFactState>(
        builder: (context, state) {
          if (state is CatFactLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CatFactError) {
            return Center(child: Text(state.error));
          }
          if (state is CatFactSuccess) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${state.catModel.fact}",
                      style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 8),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CatFactBloc>(context).add(EventFact());
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.cardBgColor)),
                      child: const Text('Another fact')),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<CatFactHistoryBloc>(context)
                            .add(EventFactHistory());

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CatFactsHistory()));
                      },
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(AppColors.cardBgColor)),
                      child: const Text('Fact History'))
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
