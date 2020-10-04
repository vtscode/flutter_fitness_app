
import 'package:flutter/material.dart';
import 'package:flutter_fitness_ui/screen/home_screen.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildImage(String assetName) {
    return Center(
      child: Align(
        child: Image.asset('assets/$assetName', width: 350.0,height: 175.0),
        alignment: Alignment.bottomCenter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      pageColor: Color(0xff192A56),
      bodyTextStyle: TextStyle(color: Colors.white,fontSize: 16),
      titleTextStyle: TextStyle(color: Colors.white,fontSize: 28),
    );

    return Scaffold(
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: "Fitness Gym",
            body: "Manfaat fitness yang bisa kita capai baik untuk pria dan untuk wanita yang semuanya sangat bermanfaat bagi kesehatan.",
            image: _buildImage('screen1.png'),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "Pembakaran Lemak",
            body: "Mereka yang ingin menurunkan berat badan dengan latihan mengangkat beban yang dilakukan tiga hari selama sepekan dalam waktu dua bulan. Setidaknya pembakaran lemak bisa mencapai 3,5 pounds.",
            image: _buildImage('screen2.jpg'),
            decoration: pageDecoration
          ),
          PageViewModel(
            title: "Mengurangi Risiko Penyakit",
            body: "Program fitnes secara teratur, kinerja jantung akan lebih optimal diiringi dengan sirkulasi darah yang lancar. Konsentrasi gula darah juga akan semakin seimbang sehingga bisa menghindarkan kita dari risiko diabetes.",
            image: _buildImage('screen3.jpg'),
            decoration: pageDecoration
          ),
          PageViewModel(
            title: "Detoksifikasi",
            body: "Selain untuk membentuk fisik dan kekuatan, program fitnes yang dijalani secara teratur akan membantu proses detoksifikasi alias pengeluaran racun dari tubuh.",
            image: _buildImage('screen4.jpg'),
            decoration: pageDecoration
          ),
        ],
        onDone: () {
          // When done button is press
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage())
          );
        },
        onSkip: () {
          // You can also override onSkip callback
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homepage())
          );
        },
        showSkipButton: true,
        skip: Icon(Icons.skip_next, color: Colors.white,),
        next: Icon(Icons.arrow_right, color: Colors.white,),
        done: Text("Done", style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white
        )),
        dotsDecorator: DotsDecorator(
            size: Size.square(10.0),
            activeSize: Size(20.0, 10.0),
            activeColor: Colors.deepOrange,
            color: Colors.black26,
            spacing: EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)
            )
        ),
      )
    );
  }
}
