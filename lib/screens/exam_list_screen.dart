import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subjectName: "Структурно програмирање", dateTime: DateTime(2026, 1, 10, 10, 0), rooms: ["Лаб 200аб", "Лаб 200в", "Лаб 215"], isPassed: false),
    Exam(subjectName: "Математика 1", dateTime: DateTime(2026, 1, 12, 12, 0), rooms: ["Лаб 200аб", "Лаб 200в", "Лаб 215", "Лаб 12", "Лаб 13", "Лаб 2"], isPassed: false),
    Exam(subjectName: "ИТОМ", dateTime: DateTime(2024, 1, 14, 9, 0), rooms: ["Лаб 13", "Лаб 12", "Лаб 2"], isPassed: false),
    Exam(subjectName: "Компјутерски мрежи и безбедност", dateTime: DateTime(2026, 1, 16, 11, 0), rooms: ["Лаб 200аб", "Лаб 215"], isPassed: false),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2026, 1, 18, 13, 0), rooms: ["Лаб 200аб", "Лаб 200в", "Лаб 215"], isPassed: false),
    Exam(subjectName: "Алгорими и податочни структури", dateTime: DateTime(2026, 1, 20, 9, 0), rooms: ["Лаб 200аб", "Лаб 200в", "Лаб 13", "Лаб 12"], isPassed: false),
    Exam(subjectName: "Напредно програмирање", dateTime: DateTime(2025, 12, 22, 10, 0), rooms: ["Лаб 200аб"], isPassed: true),
    Exam(subjectName: "Вовед во науката на податоци", dateTime: DateTime(2026, 1, 24, 8, 0), rooms: ["Лаб 2", "Лаб 3", "Лаб 13"], isPassed: false),
    Exam(subjectName: "Веб програмирање", dateTime: DateTime(2026, 1, 26, 12, 30), rooms: ["Лаб 215", "Лаб 117", "Лаб 200в"], isPassed: false),
    Exam(subjectName: "Дизајн и архитектура на софтвер", dateTime: DateTime(2026, 1, 28, 14, 0), rooms: ["Лаб 215"], isPassed: false),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sort exams chronologically
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Распоред за испити - 220137",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.deepPurple.shade700],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade500],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                const Icon(Icons.school, color: Colors.white, size: 40),
                const SizedBox(height: 8),
                Text(
                  "Зимски испитен рок 2024/2025",
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                return ExamCard(exam: exams[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment, color: Colors.deepPurple.shade700, size: 24),
            const SizedBox(width: 8),
            Text(
              "Вкупно испити: ${exams.length}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.deepPurple.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}