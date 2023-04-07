import 'dart:developer';

import 'package:random_cats/data/models/cat_model.dart';
import 'package:random_cats/domain/repositories/cat_fact_repo.dart';
import 'package:random_cats/network/cat_fact_service.dart';

class CatFactRepositoryImpl implements CatFactRepository {
  final CatFactService catFactService;

  CatFactRepositoryImpl(this.catFactService);

  @override
  Future<CatModel> fetchFact() async {
    try {
      final data = await catFactService.getFact();
      return data;
    } on Exception catch (e) {
      log(e.toString());
      return CatModel(fact: null);
    }
  }
}
