import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVidePlayerScreen extends StatefulWidget {
  const MyVidePlayerScreen({super.key});

  @override
  State<MyVidePlayerScreen> createState() => _MyVidePlayerScreenState();
}

class _MyVidePlayerScreenState extends State<MyVidePlayerScreen> {
  late VideoPlayerController _controller;

  bool _isConnected = false;

  bool _isVideoProgressVisible = true;

  Stream<void> _checkConnectivity() async* {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      setState(() {
        _isConnected = true;
      });
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      setState(() {
        _isConnected = true;
      });
    } else {
      setState(() {
        _isConnected = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.networkUrl(Uri.parse(
    //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
    _controller = VideoPlayerController.asset('videos/v2.mp4')
      ..initialize().then((_) {
        _controller.play();
        Future.delayed(const Duration(seconds: 3)).then((value) {
          _isVideoProgressVisible = false;
        });
        setState(() {});
      });
    // someFunc().then((dynamic value) {
    //   print(value);
    // });
    //
    // someFunc().whenComplete(() {
    //   print('when complete function');
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Future<String> someFunc() async {
  //   return "Hello";
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: StreamBuilder(
          stream: _checkConnectivity(),
          builder: (context, snapshot) {
            return Center(
              child: _isConnected
                  ? _controller.value.isInitialized
                      ? GestureDetector(
                          onTap: () {
                            _isVideoProgressVisible = !_isVideoProgressVisible;
                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              _isVideoProgressVisible = false;
                            });
                            setState(() {});
                          },
                          child: AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            // aspectRatio: 9 / 16,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                VideoPlayer(_controller),
                                Visibility(
                                  visible: _isVideoProgressVisible,
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            Future.delayed(
                                                    const Duration(seconds: 3))
                                                .then((value) {
                                              setState(() =>
                                                  _isVideoProgressVisible =
                                                      false);
                                            });
                                            _controller.value.isPlaying
                                                ? _controller.pause()
                                                : _controller.play();
                                          });
                                        },
                                        child: Icon(
                                          _controller.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.green,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: VideoProgressIndicator(
                                          _controller,
                                          allowScrubbing: true,
                                          padding: const EdgeInsets.all(5),
                                          colors: const VideoProgressColors(
                                            backgroundColor: Colors.grey,
                                            bufferedColor: Colors.white,
                                            playedColor: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container()
                  : const Text('No Internet'),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
