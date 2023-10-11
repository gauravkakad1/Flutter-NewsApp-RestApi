import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Models/category_model.dart';
import 'package:news_app/view_models/news_view_model.dart';
import 'my_spinkit.dart';

class ReusableCategoryPage extends StatelessWidget {
  final String name;
   ReusableCategoryPage({super.key,required this.name});

  NewsViewModel newsViewModel = NewsViewModel();
  final format = DateFormat('MMMM dd, yyyy');
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    final height = MediaQuery.of(context).size.height * 1;
    return SizedBox(
      height: height * 0.9,
      width: width * 0.9,
      child: FutureBuilder<CategoryModel>(
        future: newsViewModel.fetchNewsCategoryApi(name),
        builder : (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: SpinKitCircle(
                size: 50,
                color: Colors.blue,
              ),
            );
          }
          else{
            return ListView.builder(
                itemCount: snapshot.data!.articles!.length,
                itemBuilder: (context, index) {
                  DateTime dateTime = DateTime.parse(snapshot.data!.articles![index].publishedAt.toString());
                  final sourceName = snapshot.data!.articles![index].source!.name.toString();
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height : height * 0.2,
                          width: width * 0.3,
                          child:ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(child: mySpinkit,),
                              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error,color: Colors.red,)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        // Positioned(
                        //   bottom: 20,
                        //   child: Card(
                        //     shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(12)
                        //     ),
                        //     child: Container(
                        //       padding: const EdgeInsets.all(10),
                        //       alignment: Alignment.bottomCenter,
                        //       height: height*0.2,
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         crossAxisAlignment: CrossAxisAlignment.center,
                        //         children: [
                        //           SizedBox(
                        //               width:width*0.51,
                        //               child: Text(
                        //                 snapshot.data!.articles![index].title.toString(),
                        //                 maxLines: 2,
                        //                 overflow: TextOverflow.ellipsis,
                        //                 style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.w700),
                        //               )
                        //           ),
                        //           const Spacer(),
                        //           SizedBox(
                        //               width: width*0.45,
                        //               // child : Row(
                        //               //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //               //   children: [
                        //               //     Text(
                        //               //       snapshot.data!.articles![index].source!.name.toString(),
                        //               //       maxLines: 1,
                        //               //       overflow: TextOverflow.ellipsis,
                        //               //       style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w600),
                        //               //     ),
                        //               //     Text(
                        //               //       format.format(dateTime),
                        //               //       maxLines: 1,
                        //               //       overflow: TextOverflow.ellipsis,
                        //               //       style: GoogleFonts.poppins(fontSize:12,fontWeight: FontWeight.w500),
                        //               //     )
                        //               //   ],
                        //               // )
                        //               child : Row(
                        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //                 children: [
                        //                   Text(snapshot.data!.articles![index].source!.name.toString() ,
                        //                     style: GoogleFonts.poppins(
                        //                         fontSize: 14 ,
                        //                         color: Colors.black54,
                        //                         fontWeight: FontWeight.w600
                        //                     ),
                        //                   ),
                        //                   Text(format.format(dateTime) ,
                        //                     style: GoogleFonts.poppins(
                        //                         fontSize: 15 ,
                        //                         fontWeight: FontWeight.w500
                        //                     ),
                        //                   ),
                        //                 ],
                        //               )
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //
                        //   ),
                        // )



                        Expanded(
                          child: Container(
                            height:  height * .18,
                            padding: EdgeInsets.only(left: 15),
                            child: Column(
                              children: [
                                Text(snapshot.data!.articles![index].title.toString() ,
                                  maxLines: 3,
                                  style: GoogleFonts.poppins(
                                      fontSize: 15 ,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w700
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(sourceName.length > 10 ? '${sourceName.substring(0, 10)}...' : sourceName,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w600
                                      ),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    Text(format.format(dateTime) ,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10 ,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )



                      ],
                    ),
                  );
                },
            );
          }
        },
      ),
    );
  }
}
