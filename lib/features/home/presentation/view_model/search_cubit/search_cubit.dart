import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/home/data/repos/search_repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/search_model/search_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late final SearchModel searchModel;
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController classTypeIdController = TextEditingController();
  final SearchRepo searchRepo;
  SearchCubit(this.searchRepo) : super(SearchInitial());
  Future<void> getSearchData() async {
    emit(SearchLoading());
    log('LOADING');
    Either<Failure, SearchModel> response;
    if (endDateController.text.isEmpty) {
      response = await searchRepo.getOneWaySearchData(
          from: fromController.text,
          to: toController.text,
          startDate: startDateController.text,
          classTypeId: classTypeIdController.text == '1' ? 1 : 2);
    } else {
      response = await searchRepo.getRoundSearchData(
          from: fromController.text,
          to: toController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          classTypeId: classTypeIdController.text == '1' ? 1 : 2);
    }
    response.fold(
      (error) {
        log('FAILURE');
        emit(SearchFailure(errMessage: error.errMessage));
      },
      (data) {
        searchModel = data;
        emit(SearchSucess());

        log(searchModel.data.toString());
      },
    );
  }
}
