import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:intl/intl.dart';
import 'package:learn_feeds_assignment_onloop/utils/string_extentions.dart';

import '../../../utils/color_constants.dart';
import '../../../utils/color_utils.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/font_family_utils.dart';
import '../../my_collection/bloc/my_collection_bloc.dart';
import '../../my_collection/bloc/my_collection_event.dart';
import '../../my_collection/bloc/my_collection_state.dart';
import '../../my_collection/model/my_collection_model.dart';
import '../bloc/feed/feed_bloc.dart';
import '../bloc/feed/feed_event.dart';
import '../bloc/feed/feed_state.dart';
import '../model/learn_feed_model.dart';

class FeedsListView extends StatefulWidget {
  const FeedsListView({Key? key}) : super(key: key);

  @override
  State<FeedsListView> createState() => _FeedsListViewState();
}

class _FeedsListViewState extends State<FeedsListView> {
  @override
  void initState() {
    super.initState();
    context.read<FeedBloc>().add(FeedRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (BuildContext context, FeedState state) {
        if (state is FeedLoaded && state.content != null) {
          return state.content!.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.content?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebviewScaffold(
                                    url: state.content![index].contentUrl,
                                    appBar: AppBar(
                                      iconTheme: const IconThemeData(
                                          color: kTextMediumGrey),
                                      backgroundColor: kWhiteColor,
                                      title: Center(
                                        child: Text(
                                          state.content![index].title,
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
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 15),
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
                                    state.content![index].thumbnailUrl,
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
                                                    state.content![index].type
                                                            .toTitleCase +
                                                        ' - ' +
                                                        DateFormat(
                                                                'MMM d, yyyy')
                                                            .format(DateTime
                                                                .parse(state
                                                                    .content![
                                                                        index]
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
                                            _bookmarkItem(
                                                state.content![index]),
                                          ],
                                        ),
                                        Text(
                                          state.content![index].title,
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
                                          state.content![index].description,
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
                                    getFillColor(
                                            state.content![index].tags[0].color)
                                        .withOpacity(0.7),
                                    getBorderColor(
                                            state.content![index].tags[0].color)
                                        .withOpacity(0.3),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    state.content![index].tags[0].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: arvo,
                                      fontWeight: FontWeight.normal,
                                      color: getBorderColor(
                                          state.content![index].tags[0].color),
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
                )
              : Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  padding: const EdgeInsets.all(10.0),
                  child: const Center(
                    child: Text(
                      'No Matches Found.',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _bookmarkItem(LearnContent content) {
    return BlocBuilder<MyCollectionBloc, MyCollectionState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            state.myCollections.any((e) => e.content.title == content.title)
                ? context.read<MyCollectionBloc>().add(
                      ToggleMyCollectionOff(
                        myCollectionModel: MyCollectionModel(
                          content: content,
                          isBookmarked: true,
                        ),
                      ),
                    )
                : context.read<MyCollectionBloc>().add(
                      ToggleMyCollectionOn(
                        myCollectionModel: MyCollectionModel(
                          content: content,
                          isBookmarked: true,
                        ),
                      ),
                    );
          },
          child:
              state.myCollections.any((e) => e.content.title == content.title)
                  ? Image.asset(
                      'assets/images/save_grey_icon.png',
                      height: 20,
                      width: 20,
                    )
                  : Image.asset(
                      'assets/images/save_white_icon.png',
                      height: 20,
                      width: 20,
                    ),
        );
      },
    );
  }
}
