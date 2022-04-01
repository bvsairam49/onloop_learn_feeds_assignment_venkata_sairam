import 'package:flutter/material.dart';

import '../app/bookmark/view/bookmark_screen.dart';
import '../utils/color_constants.dart';
import '../utils/font_family_utils.dart';

class OLAppBar extends StatefulWidget implements PreferredSizeWidget {
  ///
  final String title;
  final bool isBookMarkRequired;
  final bool isBackButtonRequired;
  const OLAppBar(
      {Key? key,
      required this.title,
      this.isBookMarkRequired = false,
      this.isBackButtonRequired = false})
      : super(key: key);

  static final _appBar = AppBar();
  @override
  Size get preferredSize => _appBar.preferredSize;

  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<OLAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Text(
          widget.title,
          style: const TextStyle(
            fontSize: 22.0,
            fontFamily: arvo,
            fontWeight: FontWeight.bold,
            color: kTextMediumGrey,
          ),
        ),
      ),
      backgroundColor: kWhiteColor,
      elevation: 0.5,
      // leadingWidth: 20.0,
      // leading: IconButton(
      //   icon: const Icon(Icons.close),
      //   color: Colors.black38,
      //   // onPressed: () => Navigator.of(context).pop(),
      // ),
      // automaticallyImplyLeading: true,
      leading: widget.isBackButtonRequired
          ? CloseButton(
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.blueGrey,
            )
          : Container(),
      automaticallyImplyLeading: false,
      actions: [
        widget.isBookMarkRequired
            ? InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BookmarkScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/save_white_icon.png',
                    height: 20.0,
                    width: 20.0,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
