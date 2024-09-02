import 'package:feedback_ideas_app_client/feedback_ideas_app_client.dart';
import 'package:feedback_ideas_app_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AllIdeasPageWidget extends StatefulWidget {
  const AllIdeasPageWidget({
    super.key,
    this.queryParameters = const <String, dynamic>{},
  });

  final Map<String, dynamic> queryParameters;

  @override
  State<AllIdeasPageWidget> createState() => _AllIdeasPageWidgetState();
}

class _AllIdeasPageWidgetState extends State<AllIdeasPageWidget> {
  bool isLoading = true;

  List<IdeaExtended> ideas = [];

  @override
  void initState() {
    super.initState();
    _getMyIdeas();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AllIdeasPageWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 600,
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 16,
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
                        height: 175,
                        footer: Text(DateFormat('yyyy-MM-dd – kk:mm').format(idea.postedAt.toLocal())),
                        trailing: Container(
                          // color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(Icons.thumb_up),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        width: double.infinity,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${idea.title}'),
                            Text(
                              'by ${idea.authorFirstName} ${idea.authorLastName}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                        description: Text(idea.content),
                      ),
                    );
                  },
                )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _getMyIdeas() async {
    setState(() {
      isLoading = true;
    });
    ideas = await serverpodClient.idea.getIdeas(
      sortBy: 'postedAt',
      sortOrder: 1,
    );
    setState(() {
      isLoading = false;
    });
  }
}
