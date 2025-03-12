import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wwct/models/category_model.dart';
import 'package:wwct/models/diet_model.dart';
import 'package:wwct/models/popular_model.dart';

class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
    List<CategoryModel> categories = [];
    List <DietModel> diets = [];
    List <PopularDietsModel> popularDiets = [];
    

    void _getCategories() {
      categories = CategoryModel.getCategories();
    }
    void _getDiets() {
      diets = DietModel.getDiets();
    }
    @override
    void initState() {
    _getCategories();
    }
    void _getIntialInfo(){
      categories = CategoryModel.getCategories();
      diets = DietModel.getDiets();
      popularDiets = PopularDietsModel.getPopularDiets();
    }


  @override
  Widget build(BuildContext context) {
    _getIntialInfo();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          _searchFile(),
          SizedBox(height: 40,),
          _category(),
        SizedBox(height: 40,),
        _dietSeletion(),
        SizedBox(height: 40,),
         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Popular',
                   style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              ListView.separated(
                itemCount: popularDiets.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25,),
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          popularDiets[index].iconPath,
                          width: 65,
                          height: 65,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              popularDiets[index].name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                fontSize: 16
                              ),
                            ),
                            Text(
                              popularDiets[index].level + ' | ' + popularDiets[index].duration + ' | ' + popularDiets[index].calorie,
                              style: const TextStyle(
                                color: Color(0xff7B6F72),
                                fontSize: 13,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: (){},
                          child: SvgPicture.asset(
                            'assets/icons/button.svg',
                            width: 30,
                            height: 30,
                          ),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: popularDiets[index].boxIsSelected ?
                       Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: popularDiets[index].boxIsSelected ? [
                        BoxShadow(
                          color: const Color(0xff1D1617).withOpacity(0.07),
                          offset: const Offset(0, 10),
                          blurRadius: 40,
                          spreadRadius: 0
                        )
                      ] : []
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 40,),
        SizedBox(height: 20,),
       
       
        ],
      ),
    );
  }

  Column _dietSeletion() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Recommendation\nfor Diet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 240,
            child: ListView.separated(
              itemBuilder: (context, index){
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(diets[index].iconPath),
                      Column(
                        children: [
                          Text(
                            diets[index].name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                        diets[index].level + ' . ' + diets[index].duration + ' . ' + diets[index].calorie,
                        style: TextStyle(
                          color: Color(0xffB1B1B1),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                        ],
                      ),

                      
                      
                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text(
                            'View',
                            style: TextStyle(
                              color: diets[index].viewIsSelected ? Colors.white : Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected ? Color(0xff9DCEFF) : Color.fromARGB(255, 125, 193, 238),
                              diets[index].viewIsSelected ? Color(0xff92A3FD) : Color.fromARGB(255, 137, 200, 219),
                             
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )
                    ],
                  ),


                );
              },
              separatorBuilder: (context, index) => SizedBox(width: 30,),
              itemCount: diets.length,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 30,right: 30),
            ),
          )

        ],
      );
  }

  Column _category() {
    return Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child:  Text(
              'Catagories',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            )
              ),
              SizedBox(height: 15,),
              Container(
                height: 120,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder:  (context, index) => SizedBox(width: 10,),
                  itemBuilder:(context, index){
                    return Container(
                    width: 150,
                    decoration: BoxDecoration(
                      color: categories[index].boxColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            // child: SvgPicture.asset(categories[index].iconPath),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    );
                  }
                   ),
              )
            
           
          ],
        );
  }

  Container _searchFile() {
    return Container(
            margin: EdgeInsets.only(top:40,left: 20, right: 28),
              decoration: BoxDecoration(
               boxShadow:[
                BoxShadow(
                  color: Color(0xff1D1617).withOpacity(0.1),
                  spreadRadius: 0.0,
                  blurRadius: 40,
                  // offset: Offset(0, 10), // changes position of shadow
                )
                
               ]
              ),

            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xffF7F8F8),
                contentPadding: EdgeInsets.all(15),
                hintText: 'Search for food',
                hintStyle: TextStyle(
                  color: Color(0xffB1B1B1),
                  fontSize: 14,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset('assets/icons/Search.svg'),
                ),
                suffixIcon:Container(
                  width: 100,
                  child: IntrinsicHeight(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      VerticalDivider(
                        color: Colors.black,
                        indent: 10,
                        endIndent: 10,
                        thickness: 0.1,
                        // width: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset('assets/icons/Filter.svg'),
                      ),
                    ],
                  ),
                  ),
                
                ),
                border: OutlineInputBorder(
                  borderRadius:BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                   ),
              ),
            ) ,
        );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakefast',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
      leading: Container(
       margin: EdgeInsets.all(10),
       alignment: Alignment.center,
       child: SvgPicture.asset('assets/icons/Arrow - Left 2.svg',
       height: 20,
       width: 20,),
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(50),
        )
        
      ),
      actions: [
        GestureDetector(
          onTap: (){
            
          },
       child: Container(
       margin: EdgeInsets.all(10),
       alignment: Alignment.center,
       width: 75,
       child: SvgPicture.asset('assets/icons/dots.svg',
       height: 5,
       width: 5,),
        decoration: BoxDecoration(
          color: Color(0xffF7F8F8),
        borderRadius: BorderRadius.circular(50),
        )
        
      ),
        )
       
      ],
      
    );
  }
}
