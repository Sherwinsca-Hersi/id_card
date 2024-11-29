import 'package:flutter/material.dart';
import 'package:id_card/res/Colors.dart';
import 'package:id_card/res/components/k_common_container.dart';
import 'package:id_card/res/components/k_text.dart';
import 'package:id_card/view_model/dashboard_provider.dart';
import 'package:provider/provider.dart';

class StudConfirmedScreen extends StatefulWidget {
  const StudConfirmedScreen({super.key});

  @override
  State<StudConfirmedScreen> createState() => _StudConfirmedScreenState();
}

class _StudConfirmedScreenState extends State<StudConfirmedScreen> {

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
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back,color: AppColors.fontWhite,)),
          centerTitle: true,
          title: MyText(text: "Confirmed Pictures",fontWeight: FontWeight.bold,color: AppColors.fontWhite,),
        ),
        body: CommonContainer(
          image: "assets/images/vector_bg.jpg",
          child: dashboardProvider.isLoading ?
          Center(child: CircularProgressIndicator(
            color: AppColors.primary,
          )) :
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: screenWidth,
                    child: ListView.builder(
                        itemCount: dashboardProvider.confirmedData.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder:(context,index){
                          final  confirmedData= dashboardProvider.confirmedData[index];
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Card(
                              elevation: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Container(
                                  width: screenWidth*0.90,
                                  height: screenHeight*0.10,
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: MyText(text: "${confirmedData.Class}-${confirmedData.Section}",
                                          color: AppColors.fontBlack,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: MyText(text: "1",
                                              color: AppColors.fontBlack,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Icon(Icons.arrow_forward_ios,
                                                size: 15,
                                              )
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
