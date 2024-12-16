import 'dart:developer';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:id_card/res/Colors.dart';
import 'package:id_card/res/components/k_common_container.dart';
import 'package:id_card/res/components/k_text.dart';
import 'package:id_card/view_model/dashboard_provider.dart';
import 'package:id_card/views/stud_completed_screen.dart';
import 'package:id_card/views/stud_confirmed_screen.dart';
import 'package:id_card/views/stud_pending_screen.dart';
import 'package:provider/provider.dart';

import '../res/components/k_dash_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      Provider.of<DashboardProvider>(context,listen: false).getDashData(context);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


    return Consumer<DashboardProvider>(builder: (context,dashboardProvider,_){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: MyText(text:"Dashboard",color: AppColors.fontWhite,fontSize: 20,fontWeight: FontWeight.bold,),
          actions: [
            PopupMenuButton<int>(
              iconColor: AppColors.fontWhite,
              onSelected: (item){
                switch(item){
                  case 0:
                    log("logout");
                    break;
                }
              },
              itemBuilder: (BuildContext context)=>[
                const PopupMenuItem<int>(
                  value: 0,
                  child: Align(
                      alignment: Alignment.center,
                      child: MyText(text: "Logout")),
                ),
              ],
            )
          ],
        ),
        body: CommonContainer(
            image: ("assets/images/vector_2.jpg"),
            child: dashboardProvider.isLoading ?
            Center(child: CircularProgressIndicator(
              color: AppColors.primary,
            )) :
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MyText(
                      text: "${dashboardProvider.schoolName}",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                        width:screenWidth,
                        child: GridView.count(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2,
                          crossAxisSpacing: 30,
                          mainAxisSpacing: 40,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudPendingScreen()));
                              },
                              child: DashContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                      text: "Pending\n Students",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyTextColor,
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: MyText(text: "${dashboardProvider.pendingCount}",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudCompletedScreen()));
                              },
                              child: DashContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(
                                        text: "Pictures\n Taken",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyTextColor,
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: MyText(text: "${dashboardProvider.completedCount}",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudConfirmedScreen()));
                              },
                              child: DashContainer(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyText(text: "Confirmed\n  Students",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyTextColor,
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: MyText(text: "${dashboardProvider.confirmedCount}",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DashContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.userGraduate,
                                    color: AppColors.greyTextColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: MyText(text: "Staff's\n  Card",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyTextColor,
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DashContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    color: AppColors.greyTextColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: MyText(text: "Staff's\n  Card",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyTextColor,
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            DashContainer(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.userXmark,
                                    color: AppColors.greyTextColor,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: MyText(text: "Remove Student",
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.greyTextColor,
                                      textAlign: TextAlign.center,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        )
                    ),
                  ),
                  SizedBox(
                    width: screenWidth*0.80,
                    height: screenHeight*0.50,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: dashboardProvider.pendingCount!.toDouble(),
                            color: Colors.orange,
                            title: 'Pending (${dashboardProvider.pendingCount})',
                          ),
                          PieChartSectionData(
                            value: dashboardProvider.completedCount!.toDouble(),
                            color: Colors.green,
                            title: 'Completed (${dashboardProvider.completedCount})',
                          ),
                          PieChartSectionData(
                            value: dashboardProvider.confirmedCount!.toDouble(),
                            color: Colors.blue,
                            title: 'Confirmed (${dashboardProvider.confirmedCount})',
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Spacer(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MyText(text: "Version: 0.0.27",
                        fontSize: 12,
                      ),
                    ),
                  ),

                ],
              ),
            )
        ),
      );
    });
  }
}
