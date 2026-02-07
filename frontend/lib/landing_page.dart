import 'package:cinebooknew/home/loginPage/pagelogin.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'dart:math' as math;
import 'dart:async';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late PageController _movieController;
  double _currentMoviePage = 0;
  Timer? _autoScrollTimer;

  List<String> movies = [
    'assets/images/movie1.jpg',
    'assets/images/movie2.jpg',
    'assets/images/movie3.jpg',
    'assets/images/movie4.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _movieController = PageController(viewportFraction: 0.7, initialPage: 0);
    _movieController.addListener(() {
      setState(() {
        _currentMoviePage = _movieController.page ?? 0;
      });
    });

    // Start auto-scroll
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_movieController.hasClients) {
        int nextPage = (_currentMoviePage.round() + 1) % movies.length;
        _movieController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _movieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        // First page with movie carousel at top
        PageViewModel(
          decoration: PageDecoration(
            pageColor: Colors.transparent,
            bodyFlex: 10,
            imageFlex: 4,
          ),
          titleWidget: Container(
            child: Column(
              children: [
                // Logo at the very top
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 250,
                    width: 250,
                  ),
                ),

                SizedBox(height: 10),

                // Movie Carousel
                SizedBox(
                  height: 300,
                  child: PageView.builder(
                    controller: _movieController,
                    itemCount: movies.length,
                    onPageChanged: (index) {
                      // Reset timer when user manually swipes
                      _autoScrollTimer?.cancel();
                      _startAutoScroll();
                    },
                    itemBuilder: (context, index) {
                      return _buildMovieCard(index);
                    },
                  ),
                ),
              ],
            ),
          ),
          bodyWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),

              // Title below carousel
              Text(
                "Welcome To CineBook",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 12),

              // Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Discover and book the latest movies in Theater",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        ),

        // Second page with background image
        PageViewModel(
          decoration: PageDecoration(
  
            imagePadding: EdgeInsets.zero,  // Remove all padding
            contentMargin: EdgeInsets.zero,  // Remove content margin
            footerPadding: EdgeInsets.zero,  // Remove footer padding
            fullScreen: true,  // Make it fullscreen
            bodyFlex: 3,
            imageFlex: 3,
            boxDecoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/intro2/hall.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Dark overlay
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          titleWidget: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Text(
              "Fast and Reliable",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          bodyWidget: Container(
            child: Column(
              children: [
                Icon(Icons.event_seat, size: 100, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  "Easy seat selection and booking",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ],
      onDone: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginpage()),
        );
      },
      showSkipButton: true,
      skip: Container(
        height: 35,
        width: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Center(
          child: Text("Skip", style: TextStyle(color: Colors.black)),
        ),
      ),
      next: CircleAvatar(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_forward, color: Colors.black, size: 25),
      ),
      done: Container(
        width: 65,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
        ),
        child: Center(
          child: Text("Done", style: TextStyle(color: Colors.black)),
        ),
      ),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.white,
        activeColor: Colors.white,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
        ),
      ),
    );
  }

  Widget _buildMovieCard(int index) {
    double diff = (_currentMoviePage - index).abs();
    double scale = math.max(0.75, 1 - (diff * 0.25));
    double verticalOffset = diff * 50;
    double opacity = math.max(0.5, 1 - (diff * 0.5));

    return Transform.scale(
      scale: scale,
      child: Transform.translate(
        offset: Offset(0, verticalOffset),
        child: Opacity(
          opacity: opacity,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                movies[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[800],
                    child: Center(
                      child: Icon(Icons.movie, size: 80, color: Colors.white54),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}