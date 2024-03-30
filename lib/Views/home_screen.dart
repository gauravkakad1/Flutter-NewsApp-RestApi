// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:intl/intl.dart';
// import 'package:news_app/Models/NewsChannelHeadLinesModel.dart';
// import 'package:news_app/Utils/api_urls.dart';
// import 'package:news_app/Utils/constants/my_spinkit.dart';
// import 'package:news_app/view_models/news_view_model.dart';
// import 'package:cached_network_image/cached_network_image.dart';

// import '../Models/category_model.dart';
// import 'category_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// enum ChannelNames { abcNews, bbcNews, reuTers, cNN, independent, alJazeera }

// class _HomeScreenState extends State<HomeScreen> {
//   final List<String> channelNames = [
//     "abc-news",
//     "bbc-news",
//     "reuters",
//     "cnn",
//     "independent",
//     "aljazeera"
//   ];
//   ChannelNames? selectedChannel;
//   String name = "bbc-news";

//   NewsViewModel newsViewModel = NewsViewModel();
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height * 1;
//     final width = MediaQuery.of(context).size.width * 1;
//     final format = DateFormat('MMMM dd, yyyy');
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("News"),
//         leading: InkWell(
//           child: IconButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => CategoryScreen()));
//             },
//             icon:
//                 Image.asset('images/category_icon.png', width: 25, height: 25),
//           ),
//         ),
//         actions: [
//           PopupMenuButton<ChannelNames>(
//             onSelected: (ChannelNames value) {
//               if (ChannelNames.bbcNews.name == value.name) {
//                 name = "bbc-news";
//               } else if (ChannelNames.abcNews.name == value.name) {
//                 name = "abc-news";
//               } else if (ChannelNames.reuTers.name == value.name) {
//                 name = "reuters";
//               } else if (ChannelNames.cNN.name == value.name) {
//                 name = "cnn";
//               } else if (ChannelNames.alJazeera.name == value.name) {
//                 name = "ary-news";
//               } else if (ChannelNames.independent.name == value.name) {
//                 name = "independent";
//               }
//               setState(() {});
//             },
//             initialValue: selectedChannel,
//             icon: Icon(Icons.more_vert),
//             itemBuilder: (context) => <PopupMenuEntry<ChannelNames>>[
//               PopupMenuItem(
//                   child: Text("ABC-NEWS"), value: ChannelNames.abcNews),
//               PopupMenuItem(
//                   child: Text("BBC_NEWS"), value: ChannelNames.bbcNews),
//               PopupMenuItem(child: Text("CNN"), value: ChannelNames.cNN),
//               PopupMenuItem(
//                 child: Text("INDEPENDENT"),
//                 value: ChannelNames.independent,
//               ),
//               PopupMenuItem(
//                 child: Text("ALJAZEERA"),
//                 value: ChannelNames.alJazeera,
//               ),
//               PopupMenuItem(
//                 child: Text("REUTERS"),
//                 value: ChannelNames.reuTers,
//               ),
//             ],
//           ),
//           SizedBox.fromSize(
//             size: const Size.fromWidth(10),
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: ListView(
//           children: [
//             SizedBox(
//               height: height * 0.6,
//               width: width * 0.9,
//               child: FutureBuilder<NewsChannelHeadLinesModel>(
//                 // future: newsViewModel.fetchNewsHeadLineApi(ApiUrls.topHeadLineApi),
//                 future: newsViewModel.fetchNewsHeadLineApi(name),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: SpinKitCircle(
//                         size: 50,
//                         color: Colors.blue,
//                       ),
//                     );
//                   } else {
//                     return ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: snapshot.data!.articles!.length,
//                       itemBuilder: (context, index) {
//                         DateTime dateTime = DateTime.parse(snapshot
//                             .data!.articles![index].publishedAt
//                             .toString());
//                         return Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Stack(
//                             alignment: Alignment.bottomCenter,
//                             children: [
//                               SizedBox(
//                                 height: height * 0.6,
//                                 width: width * 0.8,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: CachedNetworkImage(
//                                     imageUrl: snapshot
//                                         .data!.articles![index].urlToImage
//                                         .toString(),
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Container(
//                                       child: mySpinkit,
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Center(
//                                             child: Icon(
//                                       Icons.error,
//                                       color: Colors.red,
//                                     )),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 10,
//                                 right: 10,
//                                 left: 10,
//                                 child: Card(
//                                   shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(12)),
//                                   child: Container(
//                                     padding: const EdgeInsets.all(10),
//                                     alignment: Alignment.bottomCenter,
//                                     height: height * 0.22,
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         SizedBox(
//                                             width: width * 0.75,
//                                             child: Text(
//                                               snapshot
//                                                   .data!.articles![index].title
//                                                   .toString(),
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                               style: GoogleFonts.poppins(
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w700),
//                                             )),
//                                         const Spacer(),
//                                         SizedBox(
//                                             width: width * 0.75,
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 Text(
//                                                   snapshot
//                                                       .data!
//                                                       .articles![index]
//                                                       .source!
//                                                       .name
//                                                       .toString(),
//                                                   maxLines: 2,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: GoogleFonts.poppins(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.w700),
//                                                 ),
//                                                 Text(
//                                                   // "${DateTime.now().hour}:${DateTime.now().minute}",
//                                                   format.format(dateTime),
//                                                   maxLines: 2,
//                                                   overflow:
//                                                       TextOverflow.ellipsis,
//                                                   style: GoogleFonts.poppins(
//                                                       fontSize: 15,
//                                                       fontWeight:
//                                                           FontWeight.w600),
//                                                 )
//                                               ],
//                                             ))
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             ),
//             // SizedBox(height: 20,)
//             SizedBox(
//               height: height * 0.9,
//               width: width * 0.9,
//               child: FutureBuilder<CategoryModel>(
//                 future: newsViewModel.fetchNewsCategoryApi(name),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: SpinKitCircle(
//                         size: 50,
//                         color: Colors.blue,
//                       ),
//                     );
//                   } else {
//                     return ListView.builder(
//                       itemCount: snapshot.data!.articles!.length,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.all(12.0),
//                           child: Row(
//                             children: [
//                               SizedBox(
//                                 height: height * 0.2,
//                                 width: width * 0.3,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(15),
//                                   child: CachedNetworkImage(
//                                     imageUrl: snapshot
//                                         .data!.articles![index].urlToImage
//                                         .toString(),
//                                     fit: BoxFit.cover,
//                                     placeholder: (context, url) => Container(
//                                       child: mySpinkit,
//                                     ),
//                                     errorWidget: (context, url, error) =>
//                                         const Center(
//                                             child: Icon(
//                                       Icons.error,
//                                       color: Colors.red,
//                                     )),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Card(
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(12)),
//                                 child: Container(
//                                   padding: const EdgeInsets.all(10),
//                                   alignment: Alignment.bottomCenter,
//                                   height: height * 0.2,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                           width: width * 0.51,
//                                           child: Text(
//                                             snapshot
//                                                 .data!.articles![index].title
//                                                 .toString(),
//                                             maxLines: 2,
//                                             overflow: TextOverflow.ellipsis,
//                                             style: GoogleFonts.poppins(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w700),
//                                           )),
//                                       const Spacer(),
//                                       SizedBox(
//                                           width: width * 0.45,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 snapshot.data!.articles![index]
//                                                     .source!.name
//                                                     .toString(),
//                                                 maxLines: 1,
//                                                 softWrap: true,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: GoogleFonts.poppins(
//                                                     fontSize: 12,
//                                                     fontWeight:
//                                                         FontWeight.w700),
//                                               ),
//                                               Text(
//                                                 "${DateTime.now().hour}:${DateTime.now().minute}",

//                                                 // snapshot.data!.articles![index].publishedAt.toString(),
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                                 style: GoogleFonts.poppins(
//                                                     fontSize: 12,
//                                                     fontWeight:
//                                                         FontWeight.w600),
//                                               )
//                                             ],
//                                           ))
//                                     ],
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         );
//                       },
//                     );
//                   }
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Models/NewsChannelHeadLinesModel.dart';
import 'package:news_app/Utils/api_urls.dart';
import 'package:news_app/Utils/constants/my_spinkit.dart';
import 'package:news_app/view_models/news_view_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news_app/Models/category_model.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum ChannelNames { abcNews, bbcNews, reuTers, cNN, independent, alJazeera }

class _HomeScreenState extends State<HomeScreen> {
  final List<String> channelNames = [
    "abc-news",
    "bbc-news",
    "reuters",
    "cnn",
    "independent",
    "aljazeera"
  ];
  ChannelNames? selectedChannel;
  String name = "bbc-news";

  NewsViewModel newsViewModel = NewsViewModel();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final format = DateFormat('MMMM dd, yyyy');

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("News App",
            style: TextStyle(color: Colors.black, fontSize: 26)),
        leading: InkWell(
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CategoryScreen()),
              );
            },
            icon: Image.asset(
              'images/category_icon.png',
              width: 25,
              height: 25,
            ),
          ),
        ),
        actions: [
          PopupMenuButton<ChannelNames>(
            onSelected: (ChannelNames value) {
              setState(() {
                selectedChannel = value;
                switch (value) {
                  case ChannelNames.bbcNews:
                    name = "bbc-news";
                    break;
                  case ChannelNames.abcNews:
                    name = "abc-news";
                    break;
                  case ChannelNames.reuTers:
                    name = "reuters";
                    break;
                  case ChannelNames.cNN:
                    name = "cnn";
                    break;
                  case ChannelNames.alJazeera:
                    name = "ary-news";
                    break;
                  case ChannelNames.independent:
                    name = "independent";
                    break;
                }
              });
            },
            initialValue: selectedChannel,
            icon: const Icon(Icons.more_vert),
            itemBuilder: (context) => <PopupMenuEntry<ChannelNames>>[
              const PopupMenuItem(
                child: Text("ABC-NEWS"),
                value: ChannelNames.abcNews,
              ),
              const PopupMenuItem(
                child: Text("BBC_NEWS"),
                value: ChannelNames.bbcNews,
              ),
              const PopupMenuItem(
                child: Text("CNN"),
                value: ChannelNames.cNN,
              ),
              const PopupMenuItem(
                child: Text("INDEPENDENT"),
                value: ChannelNames.independent,
              ),
              const PopupMenuItem(
                child: Text("ALJAZEERA"),
                value: ChannelNames.alJazeera,
              ),
              const PopupMenuItem(
                child: Text("REUTERS"),
                value: ChannelNames.reuTers,
              ),
            ],
          ),
          SizedBox.fromSize(
            size: Size.fromWidth(10),
          )
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: height * 0.6,
              width: width * 0.9,
              child: FutureBuilder<NewsChannelHeadLinesModel>(
                future: newsViewModel.fetchNewsHeadLineApi(name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        final dateTime = DateTime.parse(
                          snapshot.data!.articles![index].publishedAt
                              .toString(),
                        );
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              SizedBox(
                                height: height * 0.6,
                                width: width * 0.8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      child: mySpinkit,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 10,
                                left: 10,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    alignment: Alignment.bottomCenter,
                                    height: height * 0.22,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: width * 0.75,
                                          child: Text(
                                            snapshot
                                                .data!.articles![index].title
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.poppins(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        SizedBox(
                                          width: width * 0.75,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                snapshot.data!.articles![index]
                                                    .source!.name
                                                    .toString(),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                format.format(dateTime),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.6,
              width: width * 0.9,
              child: FutureBuilder<CategoryModel>(
                future: newsViewModel.fetchNewsCategoryApi(name),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: SpinKitCircle(
                        size: 50,
                        color: Colors.blue,
                      ),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.articles!.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            children: [
                              SizedBox(
                                height: height * 0.2,
                                width: width * 0.3,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: CachedNetworkImage(
                                    imageUrl: snapshot
                                        .data!.articles![index].urlToImage
                                        .toString(),
                                    fit: BoxFit.cover,
                                    placeholder: (context, url) => Container(
                                      child: mySpinkit,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        const Center(
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  alignment: Alignment.bottomCenter,
                                  height: height * 0.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: width * 0.51,
                                        child: Text(
                                          snapshot.data!.articles![index].title
                                              .toString(),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.poppins(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: width * 0.45,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              snapshot.data!.articles![index]
                                                  .source!.name
                                                  .toString(),
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "${DateTime.now().hour}:${DateTime.now().minute}",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.poppins(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
