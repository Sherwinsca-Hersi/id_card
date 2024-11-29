import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:id_card/repos/dashboard_repo.dart';

import '../model/dashboard_response.dart';
import '../utils/toasts.dart';

class  DashboardProvider with ChangeNotifier{

    final DashboardRepository  _dashboardRepo = DashboardRepository();

    bool _isLoading = false;
    bool _isError = false;
    int _pendingCount = 0;
    int _completedCount =0;
    int _confirmedCount =0;
    List<ClassSectionData> _pendingData = [];
    List<ClassSectionData> _completedData = [];
    List<ClassSectionData> _confirmedData = [];
    String _schoolName = "";

    bool get isLoading => _isLoading;
    bool get isError => _isError;
    int  get pendingCount => _pendingCount;
    int  get completedCount => _completedCount;
    int  get confirmedCount => _confirmedCount;
    List<ClassSectionData> get pendingData   => _pendingData;
    List<ClassSectionData> get completedData => _completedData;
    List<ClassSectionData> get confirmedData => _confirmedData;
    String get schoolName => _schoolName;

    Future <void> getDashData(BuildContext context) async{

        try {

            _isLoading = true;
            notifyListeners();

            final response = await  _dashboardRepo.getDashData();

            log("error: ${response.completedData}");

            if(response.responseCode == 200){

                _pendingData = response.pendingData ?? [];
                _pendingCount = response.pendingCount ?? 0;
                log("$_pendingData");
                _completedData = response.completedData ?? [];
                _completedCount = response.completedCount ?? 0;
                log("$_completedData");
                _confirmedData = response.confirmedData ?? [];
                _confirmedCount = response.confirmedCount ?? 0;
                log("$_confirmedData");
                _schoolName = response.schoolName ?? '';

            }else{
                log("DashboardProvider: Something Went Wrong");
                Toast.showSnackbar(
                    context: context,
                    text: "Something Went Wrong",
                    backgroundColor: Colors.redAccent
                );
            }

        }catch(e){
            log("DashboardProvider: ${e}");
            throw Exception(e);
        }
        finally{
            _isLoading = false;
            notifyListeners();
        }
    }


}