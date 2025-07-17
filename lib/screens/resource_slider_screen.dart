import 'package:flutter/material.dart';
import 'package:orthalign/configs/app_utility.dart';
import 'package:orthalign/configs/yes_work_flow.dart';
import 'package:orthalign/entites/work_flow_entity.dart';
import 'package:video_player/video_player.dart';

class ResourceSliderScreen extends StatefulWidget {
  const ResourceSliderScreen({super.key});

  @override
  State<ResourceSliderScreen> createState() => _ResourceSliderScreenState();
}

class _ResourceSliderScreenState extends State<ResourceSliderScreen> {
  VideoPlayerController? _videoController;
  Future<void>? _initializeVideoFuture;
  final _pageController = PageController();
  // ignore: prefer_final_fields
  int _currentPage = 0;
  String videoInitialSource = 'assets/Videos/attach_bracket.mp4';
  List<WorkFlowEntity> workflows = YesWorkflow().paths;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _videoController!.dispose();
  }

  bool _imageChecker(String imageName) {
     bool isImage = imageName.split('.').last == 'png';
     return isImage;
  }

  void videoInitializer(index) async{
    String resourcePath = workflows[index].value;

    if(_videoController != null) {
      await _videoController!.pause();
      await _videoController!.dispose();
      _videoController = null;
    }

    if(!_imageChecker(resourcePath)) {
      _videoController = VideoPlayerController.asset(resourcePath);
      _initializeVideoFuture = _videoController!.initialize().then((_) {
        setState(() {
          
        });
      }).catchError((e) {
        print("Error initializing video: $e");
      });
      await _videoController!.setLooping(true);
      await _videoController!.play();

      print([
        'video-is playing',
        resourcePath
      ]);
    }
  }
  void _onPageChanged() async{
    final newPage = _pageController.page?.round() ?? 0;
    if (newPage != _currentPage) {
      setState(() => _currentPage = newPage);
      print([
        'current Page',
        newPage,
        _currentPage
      ]);
      videoInitializer(newPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView.builder(
          controller: _pageController,
          itemCount: workflows.length,
          itemBuilder: (context, index) {
            bool isImage = _imageChecker(workflows[index].value);
            if (isImage) {
              return imageViewer(index);
            } else {
              return videoViewer();
            }
          },
        ),
      ),
    );
  }

  Widget videoViewer() {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Spacer(),
          workflows[_currentPage].headerPath != null ? videoViewerWrapper(workflows[_currentPage].headerPath!.topPath):
          Text('no data'),

          FutureBuilder(future: _initializeVideoFuture, builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              if (_videoController != null && _videoController!.value.isInitialized) {
                return Container(
                  alignment: Alignment.center,
                  child: LayoutBuilder(builder: (context, size){
                    return AspectRatio(aspectRatio: _videoController!.value.aspectRatio,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Container(
                        height: _videoController?.value.size.height,
                        width: _videoController?.value.size.width,
                        child: VideoPlayer(_videoController!),
                      ),
                    ),);
                  }),
                );
              } else {
                return Center(
                  child: Text('Video Loading...', style: TextStyle(color: Colors.white),),
                );
              }
            }
          }),
          workflows[_currentPage].headerPath != null ? videoViewerWrapper(workflows[_currentPage].headerPath!.bottomPath):
          Text('no data'),
          Spacer()
        ],
      ),
    );
  }

  Widget videoViewerWrapper(path) {
    return Container(
      height: AppUtility.getVerticalSize(context, 100),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage(path),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
  Widget imageViewer(int index) {
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset(workflows[index].value, fit: BoxFit.contain),
    );
  }
}
