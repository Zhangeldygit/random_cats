import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cats/network/injector.dart';
import 'package:random_cats/presentation/blocs/cat_fact/cat_fact_bloc.dart';

import 'presentation/blocs/cat_fact_history/bloc/cat_fact_history_bloc.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CatFactBloc(factUseCase: injector())..add(EventFact()),
        ),
        BlocProvider(
          create: (context) => CatFactHistoryBloc(),
        )
      ],
      child: child,
    );
  }
}
