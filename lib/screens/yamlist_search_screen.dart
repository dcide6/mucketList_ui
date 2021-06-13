import 'package:flutter/material.dart';
import 'package:mklistui/models/yam_list_model.dart';

class YamListSearch extends SearchDelegate<YamListModel> {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    // throw UnimplementedError();
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    // throw UnimplementedError();
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    // throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final mylist = query.isEmpty
        ? loadYamList()
        : loadYamList().where((q) => q.restrId.startsWith(query)).toList();
    // TODO: implement buildSuggestions
    // throw UnimplementedError();
    return mylist.isEmpty
        ? Center(
            child: Text(
              '얌얌리스트가 없어요...',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        : ListView.builder(
            itemCount: mylist.length,
            itemBuilder: (context, index) {
              final YamListModel yamlist = mylist[index];
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      yamlist.restrId,
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      yamlist.memo,
                      style: TextStyle(color: Colors.grey),
                    ),
                    Divider(),
                  ],
                ),
              );
            });
  }
}
