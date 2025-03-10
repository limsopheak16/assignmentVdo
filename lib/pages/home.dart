import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        
      ),
    );
  }
}
