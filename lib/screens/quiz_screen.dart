import 'package:flutter/material.dart';

import '../models/model.dart';

class QuizScreen extends StatefulWidget {
  final QuizSet quizSet;
  const QuizScreen({super.key, required this.quizSet});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<int?> selectedAnswers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedAnswers = List<int?>.filled(widget.quizSet.questions.length, null);
  }

  void goToNextQuestion() {
    if (currentQuestionIndex < widget.quizSet.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

    void goToPreviousQuestion() {
      if (currentQuestionIndex > 0) {
        setState(() {
          currentQuestionIndex--;
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    final Question currentQuestion =
        widget.quizSet.questions[currentQuestionIndex];
    return  Scaffold(
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
              ]
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:  35),
              Padding(padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    Text(widget.quizSet.name,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.8,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        currentQuestion.question,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
