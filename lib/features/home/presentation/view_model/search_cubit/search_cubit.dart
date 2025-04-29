import 'package:dartz/dartz.dart';
import 'package:flighter/core/utils/failure.dart';
import 'package:flighter/features/home/data/repos/search_repo/search_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/search_model/search_model.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  late SearchModel searchModel;
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController endDateController = TextEditingController();
  final TextEditingController numbersTravelerController =
      TextEditingController();
  final TextEditingController classTypeIdController = TextEditingController();
  final SearchRepo searchRepo;
  bool secondPush = false ; 
  bool cheapestFilter = false, fastestFilter = false, airlinesFilter = false;
  List<int> airlines = [];
  SearchCubit(this.searchRepo) : super(SearchInitial());
  Future<void> getSearchData() async {
    emit(SearchLoading());
    Either<Failure, SearchModel> response;
    if (endDateController.text.isEmpty) {
      startDateController.text = '2025-04-21';

      response = await searchRepo.getOneWaySearchData(
          from: fromController.text,
          to: toController.text,
          startDate: startDateController.text,
          noOfTravelers: int.parse(numbersTravelerController.text),
          classTypeId: int.parse(classTypeIdController.text),
          cheapestFilter: cheapestFilter,
          fastestFilter: fastestFilter,
          airlines: airlines);
    } else {
      startDateController.text = '2025-04-21';
      endDateController.text = '2025-04-21';
      response = await searchRepo.getRoundSearchData(
          from: fromController.text,
          to: toController.text,
          startDate: startDateController.text,
          endDate: endDateController.text,
          noOfTravelers: int.parse(numbersTravelerController.text),
          classTypeId: int.parse(classTypeIdController.text),
          cheapestFilter: cheapestFilter,
          fastestFilter: fastestFilter,
          airlines: airlines);
    }
    response.fold(
      (error) {
        emit(SearchFailure(errMessage: error.errMessage));
      },
      (data) {
        searchModel = data;
        emit(SearchSucess());
      },
    );
  }
}
