

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/Model/SuraModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/Provider/Mytheme.dart';
import 'package:provider/provider.dart';

import '../themeData/ThemeData.dart';


class Sura_content extends StatefulWidget {
static const String routeName="Sura";

  @override
  State<Sura_content> createState() => _Sura_contentState();
}

class _Sura_contentState extends State<Sura_content> {

List<String>su=[];
  @override
  Widget build(BuildContext context) {
    var pt=Provider.of<Mytheme>(context);

    var args=ModalRoute.of(context)?.settings.arguments as SuraModel;
    if(su.isEmpty) {
      LoadFiles(args.indx);
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(pt.themeData==Themedata.light?"assets/images/bg3.png":"assets/images/bg.png"),fit: BoxFit.fill),
      ),
      child:Scaffold(
      appBar: AppBar(
      title: Text(AppLocalizations.of(context)!.apptitle,style: Theme.of(context).textTheme.bodyLarge,),
    ),
        body: Column(
          children: [
            SizedBox(height: 40,),
          Text(args.SuraName,style: Theme.of(context).textTheme.bodyLarge,),
            Divider(height: 2,thickness: 2,indent: 100,endIndent: 100,),
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return Card(
                  color: pt.themeData==Themedata.light?Colors.white:Color(0xff141A2E),
                  elevation: 5,
                  child: Center(
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(su[index],style: Theme.of(context).textTheme.labelMedium)),
                  ),
                );

              },itemCount:su.length ,),
            )

        ],),

      ));
  }
  void LoadFiles(int index) async
  {
   String sura=await rootBundle.loadString("assets/files/${index+1}.txt");
   List<String>Lines=sura.split("\n");
   su=Lines;
   setState(() {

   });
  }
}