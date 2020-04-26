import 'package:flutter/material.dart';
import 'package:cs386/util/data.dart';
import 'package:cs386/widgets/chat_item.dart';

class Messages extends StatefulWidget{
  @override
  _MessagesState createState() => _MessagesState();
}

class sendMessage {
  final String messageType;
  final int messageDate;
  final int messageID;
  deleteMessage(){
    //Delete message specs.
  }

  removeFromGroup() {
    //remove from group specs.
  }
  addToGroup() {
    //add to group specs.
  }
  messageFriend() {
    //Messaging friend specs.
  }
  messageGroup() {
    //Message group specs.
  }
}

class newMessage extends sendMessage {
  addToGroup() {
    //specific to this class implementation.
  }
  messageFriend() {
    //Messaging friend specs.
    //specific to this class implementation.
  }
  messageGroup() {
    //Message group specs.
    //specific to this class implementation.
  }
}

class _MessagesState extends State<Messages> with SingleTickerProviderStateMixin,
    AutomaticKeepAliveClientMixin{
  TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(vsync: this, initialIndex:0, length: 2);
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
          ),
          onPressed: (){},
        ),
        title: TextField(
          decoration: InputDecoration.collapsed(hintText: 'Search',
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon:Icon(
              Icons.filter_list,
            ),
            onPressed: (){},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Theme.of(context).accentColor,
          labelColor: Theme.of(context).accentColor,
          unselectedLabelColor: Theme.of(context).textTheme.caption.color,
          isScrollable: false,
          tabs: <Widget>[
            Tab(
              text: "Message",
            ),
            Tab(
              text: "Groups",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index){
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(),
                ),
              );
            },
            itemCount: chats.length,
            itemBuilder: (BuildContext context, int index){
              Map chat = chats[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
              );
            },

          ),
          ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (BuildContext context, int index){
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width / 1.3,
                  child: Divider(),
                ),
              );
            },
            itemCount: groups.length,
            itemBuilder: (BuildContext context, int index) {
              Map chat = groups[index];
              return ChatItem(
                dp: chat['dp'],
                name: chat['name'],
                isOnline: chat['isOnline'],
                counter: chat['counter'],
                msg: chat['msg'],
                time: chat['time'],
              );
            },
          ),
        ],
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}