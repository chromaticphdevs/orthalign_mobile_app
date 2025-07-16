import 'package:flutter/material.dart';
import 'package:orthalign/configs/app_utility.dart';
import 'package:orthalign/entites/work_flow_entity.dart';
import 'package:video_player/video_player.dart';

class ResourceSliderScreen extends StatefulWidget {
  const ResourceSliderScreen({super.key});

  @override
  State<ResourceSliderScreen> createState() => _ResourceSliderScreenState();
}

class _ResourceSliderScreenState extends State<ResourceSliderScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _videoController = VideoPlayerController.asset('assets/Videos/animation_unlock_levers_left.mp4')..initialize().then((_) {
      setState(() {
        
      });
      _videoController.setLooping(true);
      _videoController.play();
    });
    // _videoController..initialize('assets/Videos/animation_unlock_levers_left.mp4').then((_){
    //   setState(() {
        
    //   });
    //   _videoController.setLooping(true);
    //   _videoController.play();
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: videoViewer(),
    );
  }

  Widget videoViewer() {
      return SafeArea(child: Container(
        color: Colors.black,
        child: Column(
          children: [
            Spacer(),
            Container(
              height: AppUtility.getVerticalSize(context, 100),
              decoration: BoxDecoration(
                image: DecorationImage(image: ExactAssetImage('assets/Images/headers/unlock_levers_top.png'),
                fit: BoxFit.fill)
              ),
            ),

            _videoController.value.isInitialized ? Container(
              alignment: Alignment.center,
              child: LayoutBuilder(builder: (context, size) {
                return AspectRatio(aspectRatio: _videoController.value.aspectRatio,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    height: _videoController.value.size.height,
                    width: _videoController.value.size.width,
                    child: VideoPlayer(_videoController),
                  ),
                ),);
              }),
            ) : SizedBox(
              height: AppUtility.getVerticalSize(context, 100),
            ),
            Container(
              height: AppUtility.getVerticalSize(context, 100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/Images/headers/common_bottem.png'),
                  fit: BoxFit.fill,
                ),
              ),
            )
          ],
        ),
      ));
  }
}