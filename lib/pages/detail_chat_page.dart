import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyek3_flutter/models/message_model.dart';
import 'package:proyek3_flutter/models/product_model.dart';
import 'package:proyek3_flutter/pages/widgets/chat_bubble.dart';
import 'package:proyek3_flutter/providers/auth_provider.dart';
import 'package:proyek3_flutter/services/message_service.dart';
import 'package:proyek3_flutter/theme.dart';

class DetailChatPage extends StatefulWidget {
  ProductModel product;
  DetailChatPage(this.product);

  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  /* Menambahkan controller fitur live chat di message */
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleAddMessage() async {
      await MessageService().addMessage(
        user: authProvider.user,
        isFromUser: true,
        product: widget.product,
        message: messageController.text,
      );

      setState(() {
        widget.product = UninitializedProductModel();
        messageController.text = '';
      });
    }

    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          backgroundColor: bg3greenColor,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Image.asset(
                  'assets/icon_shope.png',
                  width: 48,
                ),
                SizedBox(
                  width: 10,
                  height: 2,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Toko Asap Cair',
                      style: putihTextStyle.copyWith(
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      'Online',
                      style: putihTextStyle.copyWith(
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    Widget productPreview() {
      return Container(
        width: 270,
        height: 100,
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: bg2greenColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: putihColor,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'http://192.168.130.189:8000/${widget.product.galleries[0].url}',
              width: 80,
            ),
            SizedBox(
              width: 2,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.name,
                    style: putihTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\Rp ${widget.product.price}',
                    style: putihTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product = UninitializedProductModel();
                });
              },
              child: Image.asset(
                'assets/close.png',
                width: 28,
              ),
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /* CHildren Tambah productpriview */
              widget.product is UninitializedProductModel
                  ? SizedBox()
                  : productPreview(),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      decoration: BoxDecoration(
                        color: bg2greenColor,
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                      ),
                      child: Center(
                        child: TextFormField(
                          controller: messageController,
                          style: putihTextStyle,
                          decoration: InputDecoration.collapsed(
                              hintText: 'Tuliskan Pesan',
                              hintStyle: putihTextStyle),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: handleAddMessage,
                    child: Image.asset(
                      'assets/button_krm.png',
                      width: 45,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget Content() {
      return StreamBuilder<List<MessageModel>>(
          stream: MessageService()
              .getMessagesByUserId(userId: authProvider.user.id),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                children: snapshot.data.map((MessageModel message) => ChatBubble(
                  isSender: message.isFromUser,
                  text: message.message,
                  product: message.product,
                )).toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          });
    }

    return Scaffold(
      backgroundColor: bggreenColor,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: Content(),
    );
  }
}
