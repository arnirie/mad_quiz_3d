import 'package:flutter/material.dart';
import 'package:mad_quiz_3d/data/questions_list.dart';

class Questions extends StatefulWidget {
  Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final question_list = QUESTION_LIST;
  final answer_list = ANSWER_LIST;
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;

  void checkAnswer(bool answer) {
    print(answer);
    //check answer
    score += answer == answer_list[questionIndex] ? 1 : 0;
    setState(() {
      if (questionIndex < question_list.length - 1) {
        questionIndex++;
      } else {
        //show score
        isFinished = true;
      }
    });
  }

  Widget showQuestions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          question_list[questionIndex],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () => checkAnswer(true),
                child: const Text(
                  'TRUE',
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => checkAnswer(false),
                child: const Text(
                  'FALSE',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget showScore() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Congrats! You got',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36,
          ),
        ),
        Text(
          '$score/${question_list.length}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 56,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isFinished ? showScore() : showQuestions(),
      ),
    );
  }
}
