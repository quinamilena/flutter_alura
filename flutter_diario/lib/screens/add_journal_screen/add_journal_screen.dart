import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_diario/helpers/logout.dart';
import 'package:flutter_diario/helpers/weekday.dart';
import 'package:flutter_diario/models/journal.dart';
import 'package:flutter_diario/screens/commom/exception_dialog.dart';
import 'package:flutter_diario/services/journal_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddJournalScreen extends StatelessWidget {
  final Journal journal;
  final bool isEditing;

  AddJournalScreen({super.key, required this.journal, required this.isEditing});

  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _contentController.text = journal.content;
    return Scaffold(
      appBar: AppBar(
        title: Text(WeekDay(journal.createdAt).toString()),
        actions: [
          IconButton(
            onPressed: () {
              registerJournal(context);
            },
            icon: Icon(Icons.check),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _contentController,
          keyboardType: TextInputType.multiline,
          style: TextStyle(fontSize: 24),
          expands: true,
          minLines: null,
          maxLines: null,
        ),
      ),
    );
  }

  registerJournal(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      String? token = prefs.getString("accessToken");

      if (token != null) {
        String content = _contentController.text;

        journal.content = content;

        JournalService service = JournalService();
        if (isEditing) {
          service
              .edit(journal.id, journal, token)
              .then((result) => {Navigator.pop(context, result)})
              .catchError(
                (error) => logout(context),
                test: (error) => error is TokenNotValidException,
              )
              .catchError(
                (error) => showExceptionDialog(context, content: error.message),
                test: (error) => error is HttpException,
              );
        } else {
          service
              .register(journal, token)
              .then((result) => {Navigator.pop(context, result)})
              .catchError(
                (error) => logout(context),
                test: (error) => error is TokenNotValidException,
              )
              .catchError(
                (error) => showExceptionDialog(context, content: error.message),
                test: (error) => error is HttpException,
              );
        }
      }
    });
  }
}
