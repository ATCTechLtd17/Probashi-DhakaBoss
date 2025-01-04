import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:probashi/models/pagestate.dart';
import 'package:probashi/models/pagetitle.dart';
import 'package:provider/provider.dart';

class PassportData extends StatelessWidget {
  const PassportData({super.key});

  @override
   Widget build(BuildContext context) {
    final pageState = Provider.of<PageState>(context);
    final titleProvider = Provider.of<PageTitle>(context);
    final title =
        titleProvider.title.isNotEmpty ? titleProvider.title : 'Default Title';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[50],
        title: Center(child: Text(title)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left_outlined),
          onPressed: () {
            pageState.setRoute('/download-card');
            GoRouter.of(context).pop('/download-card');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(25, 100, 15, 0),
        decoration: BoxDecoration(color: Colors.teal[50]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //Title
          Text(
            'Enter your passport number',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Enter your passport number',
                      hintStyle: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[600],
                        overflow: TextOverflow.ellipsis,
                      ),
                      hintMaxLines: 1,
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.teal[700]!, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                            BorderSide(color: Colors.teal[400]!, width: 1),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      elevation: WidgetStateProperty.all(2),
                      padding: WidgetStateProperty.all(
                          EdgeInsets.symmetric(vertical: 8, horizontal: 15)),
                      backgroundColor:
                          WidgetStateProperty.all(Colors.teal[600])),
                  onPressed: () {
                    //scan document
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.grey[100], fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
