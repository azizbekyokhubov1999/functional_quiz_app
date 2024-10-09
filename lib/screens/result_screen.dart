import 'package:flutter/material.dart';
import 'package:functional_quiz_app/models/model.dart';
import 'package:functional_quiz_app/screens/home_screen.dart';
import 'package:functional_quiz_app/screens/quiz_screen.dart';

class ResultScreen extends StatelessWidget {
  final int totalQuestion;
  final int totalAttempts;
  final int totalCorrect;
  final int totalScore;
  final QuizSet quizSet;

  const ResultScreen(
      {super.key,
      required this.totalQuestion,
      required this.totalAttempts,
      required this.totalCorrect,
      required this.totalScore,
      required this.quizSet});

  @override
  Widget build(BuildContext context) {
    String feedback = totalScore < 30
        ? "You Failed!"
        : totalScore < 60
            ? "Good!"
            : totalScore < 80
                ? "Great!"
                : "Awesome!";

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.purple,
                Colors.indigo,
              ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  Text(
                    "Quiz Result",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 1.3,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      feedback,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("You have scored",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("${totalScore} / ${totalQuestion * 10} ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:
                            (context) => QuizScreen(quizSet: quizSet)));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.purple,
                                    Colors.indigo,
                                  ]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Repeat",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder:
                                (context) => HomeScreen()));
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.purple,
                                    Colors.indigo,
                                  ]),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("Home",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
