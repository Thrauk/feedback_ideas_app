import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:feedback_ideas_app_flutter/src/features/authentication/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class MyIdeasPageWidget extends StatefulWidget {
  const MyIdeasPageWidget({
    super.key,
    this.queryParameters = const <String, dynamic>{},
  });

  final Map<String, dynamic> queryParameters;

  @override
  State<MyIdeasPageWidget> createState() => _MyIdeasPageWidgetState();
}

class _MyIdeasPageWidgetState extends State<MyIdeasPageWidget> {
  bool isLoading = true;
  final formKey = GlobalKey<ShadFormState>();
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  List<Idea> ideas = [];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _getMyIdeas();
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  void didUpdateWidget(covariant MyIdeasPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 600,
        child: ShadForm(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                ShadInputFormField(
                  label: const Text('Title'),
                  controller: _titleController,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Field cannot be empty!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 4),
                ShadInputFormField(
                  maxLines: 10,
                  label: const Text('Content'),
                  controller: _contentController,
                  validator: (v) {
                    if (v.isEmpty) {
                      return 'Field cannot be empty!';
                    }
                    return null;
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Divider(
                    height: 4,
                  ),
                ),
                ShadButton(
                  width: double.infinity,
                  onPressed: () async {
                    if (formKey.currentState!.saveAndValidate()) {
                      await serverpodClient.idea.postIdea(
                        title: _titleController.text,
                        content: _contentController.text,
                      );
                      await _getMyIdeas();
                    }
                  },
                  child: const Text('Post Idea!'),
                ),
                if (isLoading)
                  CircularProgressIndicator()
                else
                  ...ideas.map(
                    (idea) {
                      // final date = idea.postedAt;
                      // date.copyWith(isUtc: true);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: ShadCard(
                          footer: Text(DateFormat('yyyy-MM-dd – kk:mm').format(idea.postedAt.toLocal())),
                          width: double.infinity,
                          title: Text(idea.title),
                          description: Text(idea.content),
                        ),
                      );
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _getMyIdeas() async {
    setState(() {
      isLoading = true;
    });
    ideas = await serverpodClient.idea.getLoggedUserIdeas();
    setState(() {
      isLoading = false;
    });
  }
}
