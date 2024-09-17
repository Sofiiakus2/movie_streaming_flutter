
import 'package:flutter/material.dart';
import 'package:movie_sctreaming/models/media_model.dart';

import '../../../models/season_model.dart';
import '../../../services/user_service.dart';
import '../serial_player/serial_player_page.dart';

class SeasonView extends StatefulWidget{
  const SeasonView({super.key, required this.serial});
  final MediaModel serial;

  @override
  State<SeasonView> createState() => _SeasonViewState();
}

class _SeasonViewState extends State<SeasonView> {
  late List<bool> _isCollapsedList;
  late List<SeasonModel>? seasons = [];

  @override
  void initState() {
    super.initState();
    seasons = widget.serial.seasons;
    _isCollapsedList = List<bool>.filled(seasons?.length ?? 0, true);

  }

  void _toggleCollapse(int index) {
    setState(() {
      _isCollapsedList[index] = !_isCollapsedList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: seasons?.length,
        itemBuilder: (context, index){
          return AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                  constraints: BoxConstraints(
                    minHeight: 50,
                    maxHeight: _isCollapsedList[index] ? 50 : double.infinity,
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(seasons![index].name,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: IconButton(
                                onPressed: () => _toggleCollapse(index),
                                icon: Icon(_isCollapsedList[index] ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
                                style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: Size.zero,
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    iconColor: Theme.of(context).primaryColor
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: screenSize.width,
                          margin: const EdgeInsets.all(5),
                          child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: seasons?[index].series.length,
                              itemBuilder: (context, i){
                                return Container(
                                  height: 110,
                                  margin: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: (){
                                          UserService.addToWatchStory(widget.serial);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => SerialPlayerPage(season: seasons![index],seria: seasons![index].series[i],)),
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            SizedBox(
                                              width: screenSize.width / 2.4,
                                              height: 100,
                                              child: Image.network(
                                                seasons![index].series[i].posterUrl,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Icon(
                                                    Icons.play_circle_outline,
                                                    size: 50,
                                                    color: Colors.white.withOpacity(0.5)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: const EdgeInsets.only(left: 10, right: 10),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                seasons![index].series[i].name,
                                                style: Theme.of(context).textTheme.bodyMedium,
                                                softWrap: true,
                                                maxLines: null,
                                                overflow: TextOverflow.clip,
                                              ),
                                              Text(
                                                seasons![index].series[i].overview,
                                                style: Theme.of(context).textTheme.bodySmall,
                                                softWrap: true,
                                                maxLines: null,
                                                overflow: TextOverflow.clip,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),

                );
              },
            ),
          );
        }
    );
  }
}