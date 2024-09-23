import 'package:flutter/material.dart';

import '../../models/comment_model.dart';
import '../../models/media_model.dart';
import '../../models/user_model.dart';
import '../../services/media_service.dart';
import '../../services/user_service.dart';

class CommentsBlock extends StatefulWidget {
  const CommentsBlock({super.key, required this.film});
  final MediaModel film;

  @override
  State<CommentsBlock> createState() => _CommentsBlockState();
}

class _CommentsBlockState extends State<CommentsBlock> {
  bool isLoadingComments = true;
  TextEditingController sendCommentController = TextEditingController();
  List<CommentModel> comments = [];

  late CommentModel replyComment;
  bool isReply = false;
  late String replyUsername;

  Future<void> _fetchComments() async {
    setState(() {
      isLoadingComments = true;
    });

    try {
      List<CommentModel> fetchedComments = await MediaService.getMovieComments(widget.film.id);
      setState(() {
        comments = fetchedComments;
        isLoadingComments = false;
      });
    } catch (e) {
      setState(() {
        isLoadingComments = false;
      });
      // Handle errors
    }
  }

  Future<String> _getUserName(String id) async{
    UserModel? user = await UserService.getUserById(id);
    return user?.name ?? 'Unknown';
  }

  void _showCommentActions(BuildContext context, CommentModel comment, String username) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.report, color: Colors.red),
                title: const Text('Поскаржитися', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                  // Handle "Поскаржитися" action
                },
              ),
              ListTile(
                leading: const Icon(Icons.reply, color: Colors.blue),
                title: const Text('Відповісти', style: TextStyle(color: Colors.white)),
                onTap: () {
                  setState(() {
                    isReply = true;
                  });
                  replyComment = comment;
                  replyUsername = username;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchComments();
  }

  Future<void> _addComment() async {
    String commentText = sendCommentController.text;
    if (commentText.isNotEmpty) {
      if(isReply){
        await MediaService.addReplyToComment(widget.film.id, replyComment.id!, sendCommentController.text, );
        setState(() {
          isReply = false;
        });
      }else      {
        await MediaService.addCommentToMovie(widget.film.id, commentText);
      }      sendCommentController.clear();
      _fetchComments();
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      width: screenSize.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Коментарі', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 20),
          isLoadingComments
              ? const CircularProgressIndicator()
              : comments.isEmpty
              ? const Center(child: Text('Немає даних'))
              : ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: comments.length,
            itemBuilder: (context, index) {
              CommentModel comment = comments[index];
              return FutureBuilder<String>(
                future: _getUserName(comment.authorId),
                builder: (context, userSnapshot) {
                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (userSnapshot.hasError) {
                    return Center(
                      child: Text('Error: ${userSnapshot.error}'),
                    );
                  }

                  String? userName = userSnapshot.data;
                  if( userName==null){
                    return Container();
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: Theme.of(context).primaryColor,
                              child: const Icon(Icons.person_rounded, color: Colors.white),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userName!,
                                    style: Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(comment.text),
                                ],
                              ),
                            ),
                            //  const Expanded(child: SizedBox(),),
                            IconButton(
                                onPressed: (){
                                  _showCommentActions(context, comment, userName!);
                                },
                                icon: const Icon(Icons.more_vert))
                          ],
                        ),
                        if (comment.answers != null && comment.answers!.isNotEmpty)
                          for (var reply in comment.answers!)
                            FutureBuilder<String>(
                                future: _getUserName(reply.authorId),
                                builder: (context, snapshot) {
                                  String? replyName = snapshot.data;
                                  if( replyName==null){
                                    return Container();
                                  }
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 40, top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).dividerColor.withOpacity(0.3), // Light background for replies
                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Theme.of(context).primaryColor,
                                            child: const Icon(Icons.person_rounded, color: Colors.white, size: 18),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  replyName!, // Assuming you have a way to get the username from the authorId
                                                  //style: Theme.of(context).textTheme.bodyText?.copyWith(fontWeight: FontWeight.bold),
                                                ),
                                                Text(reply.text),
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              _showCommentActions(context, reply, reply.authorId); // Handle reply actions
                                            },
                                            icon: const Icon(Icons.more_vert, size: 16),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                            )
                      ],
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              if(isReply)
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).dividerColor.withOpacity(0.5),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          replyUsername,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(replyComment.text),
                      ],
                    ),
                  ),
                ),


              TextField(
                controller: sendCommentController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).dividerColor,
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).dialogBackgroundColor,
                      size: 22,
                    ),
                    onPressed: _addComment, // Trigger the add comment function
                  ),
                  hintText: isReply
                      ?'Відповісти $replyUsername'
                      :'Написати коментар',
                  hintStyle: Theme.of(context).textTheme.titleSmall,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
