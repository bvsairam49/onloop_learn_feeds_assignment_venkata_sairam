import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_feeds_assignment_onloop/app/home_screen/bloc/filter/filter_bloc.dart';

import '../../../utils/color_utils.dart';
import '../../../utils/decoration_utils.dart';
import '../../../utils/font_family_utils.dart';
import '../bloc/feed/feed_bloc.dart';
import '../bloc/feed/feed_event.dart';
import '../bloc/filter/filter_event.dart';
import '../bloc/filter/filter_state.dart';

class FilterTagView extends StatefulWidget {
  const FilterTagView({Key? key}) : super(key: key);

  @override
  State<FilterTagView> createState() => _FilterWrapState();
}

class _FilterWrapState extends State<FilterTagView> {
  @override
  void initState() {
    super.initState();
    context.read<FilterBloc>().add(FilterRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (BuildContext context, FilterState state) {
        if (state is FilterLoaded) {
          List<FilterChipData> filterData = [
            FilterChipData(name: "All", color: "njnkj")
          ];

          filterData.addAll(List.generate(
            state.filter.tags.length,
            (index) {
              return FilterChipData(
                  name: state.filter.tags[index].name,
                  color: state.filter.tags[index].color);
            },
          ));

          return Wrap(
            children: List.generate(
              filterData.length,
              (index) {
                return InkWell(
                  onTap: () {
                    context.read<FeedBloc>().add(FilterFeed(
                        filterText: filterData[index].name == 'All'
                            ? ''
                            : filterData[index].name));
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: boxDecoration(
                        getFillColor(filterData[index].color).withOpacity(0.5),
                        getBorderColor(filterData[index].color)
                            .withOpacity(0.3),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        filterData[index].name,
                        style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: arvo,
                          fontWeight: FontWeight.normal,
                          color: getBorderColor(filterData[index].color),
                        ),
                      )),
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class FilterChipData {
  FilterChipData({required this.name, required this.color});

  final String name;
  final String color;
}
