import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl.dart';
import 'package:learn_feeds_assignment_onloop/utils/string_extentions.dart';

import '../../../component/ol_app_bar.dart';
import '../../../utils/color_constants.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/font_family_utils.dart';
import '../bloc/my_collection_bloc.dart';
import '../bloc/my_collection_state.dart';

class MyCollectionScreen extends StatelessWidget {
  const MyCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OlAppBar(
        title: "Saved for later",
        isBackButtonRequired: true,
      ),
      body: BlocBuilder<MyCollectionBloc, MyCollectionState>(
        builder: (BuildContext context, MyCollectionState state) {
          return state.myCollections.isNotEmpty
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewScaffold(
                                    url: state.myCollections[index].content
                                        .contentUrl,
                                    appBar: AppBar(
                                      iconTheme: const IconThemeData(
                                          color: kTextMediumGrey),
                                      backgroundColor: kWhiteColor,
                                      title: Center(
                                        child: Text(
                                          state.myCollections[index].content
                                              .title,
                                          style: const TextStyle(
                                            fontSize: 22.0,
                                            fontFamily: arvo,
                                            fontWeight: FontWeight.bold,
                                            color: kTextMediumGrey,
                                          ),
                                        ),
                                      ),
                                      elevation: 0.5,
                                    ),
                                    withJavascript: true,
                                    withLocalStorage: true,
                                    withZoom: true,
                                  )),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: containerCardDecoration,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.network(
                                    state.myCollections[index].content
                                        .thumbnailUrl,
                                    width: 80.0,
                                    height: 80.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/images/article_icon.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                Center(
                                                  child: Text(
                                                    state
                                                            .myCollections[
                                                                index]
                                                            .content
                                                            .type
                                                            .toTitleCase +
                                                        ' - ' +
                                                        DateFormat(
                                                                'MMM d, yyyy')
                                                            .format(DateTime
                                                                .parse(state
                                                                    .myCollections[
                                                                        index]
                                                                    .content
                                                                    .createdAt)),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: const TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: arvo,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: kTextMediumGrey,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Image.asset(
                                              'assets/images/save_grey_icon.png',
                                              height: 20,
                                              width: 20,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          state.myCollections[index].content
                                              .title,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: const TextStyle(
                                            fontSize: 17.0,
                                            fontFamily: arvo,
                                            fontWeight: FontWeight.bold,
                                            color: kTextDarkGrey,
                                          ),
                                        ),
                                        Text(
                                          state.myCollections[index].content
                                              .description,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: arvo,
                                            fontWeight: FontWeight.bold,
                                            color: kTextLightGrey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4.0),
                              child: const Text(
                                'Shared by OnLoop',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: arvo,
                                  fontWeight: FontWeight.bold,
                                  color: kTextLightGrey,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: boxDecoration(
                                    getFillColor(state.myCollections[index]
                                        .content.tags[0].color),
                                    getBorderColor(state.myCollections[index]
                                        .content.tags[0].color),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    state.myCollections[index].content.tags[0]
                                        .name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: arvo,
                                      fontWeight: FontWeight.bold,
                                      color: getBorderColor(state
                                          .myCollections[index]
                                          .content
                                          .tags[0]
                                          .color),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/thumbs_down.png',
                                      height: 35.0,
                                      width: 35.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    Image.asset(
                                      'assets/images/thumbs_up.png',
                                      height: 35.0,
                                      width: 35.0,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: state.myCollections.length,
                )
              : const Center(
                  child: Text(
                    'No Bookmarks',
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
        },
      ),
    );
  }
}
