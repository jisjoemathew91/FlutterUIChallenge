import 'package:flutter/material.dart';
import 'package:quill/quill.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quill Editor',
      home: QuillEditorPage(),
    );
  }
}

class QuillEditorPage extends StatefulWidget {
  @override
  _QuillEditorPageState createState() => _QuillEditorPageState();
}

class _QuillEditorPageState extends State<QuillEditorPage> {
  late QuillController _controller;

  @override
  void initState() {
    super.initState();
    _controller = QuillController.basic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quill Editor'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: QuillEditor(
                controller: _controller,
                scrollController: ScrollController(),
                scrollable: true,
                focusNode: FocusNode(),
                autoFocus: true,
                readOnly: false,
                expands: false,
                padding: EdgeInsets.zero,
                embedBuilder: defaultEmbedBuilder,
                placeholder: 'Add your text here...',
                onLaunchUrl: (url) => print('Launched URL: $url'),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Retrieve the content
                final String htmlContent = _controller.document.toHtml();
                print(htmlContent);
              },
              child: Text('Get HTML Content'),
            ),
          ],
        ),
      ),
    );
  }
}
