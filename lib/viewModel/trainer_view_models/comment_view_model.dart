import 'package:flutter/material.dart';


class CommentViewModel extends ChangeNotifier {
  List<String> comments = [
    "Lorem ipsum dolor sit amet consectetur adipiscing elit.",
    "Another comment here",
  ];

  List<List<String>> replies = [
    ["This is a reply to the first comment"],
    ["Another reply here"],
  ];

  List<bool> isUserComment = [false, false];
  TextEditingController commentController = TextEditingController();

  bool isReplying = false;
  bool isEditingReply = false;
  int replyIndex = -1;
  int? editingCommentIndex;
  void addComment(String comment) {
    if (comment.trim().isEmpty) return;

    comments.add(comment.trim());
    replies.add([]); 
    isUserComment.add(true); 
    commentController.clear();
    notifyListeners();
  }
  void deleteComment(int index) {
    if (index >= 0 && index < comments.length) {
      comments.removeAt(index);
      replies.removeAt(index);
      isUserComment.removeAt(index);
      notifyListeners();
    }
  }
  void startEditComment(int index) {
    if (index >= 0 && index < comments.length) {
      editingCommentIndex = index;
      commentController.text = comments[index];
      notifyListeners();
    }
  }

  void updateEditedComment() {
    if (editingCommentIndex != null && commentController.text.trim().isNotEmpty) {
      comments[editingCommentIndex!] = commentController.text.trim();
      editingCommentIndex = null;
      commentController.clear();
      notifyListeners();
    }
  }

  void setReplyMode(int index) {
    if (index >= 0 && index < comments.length) {
      isReplying = true;
      isEditingReply = false;
      replyIndex = index;
      commentController.clear();
      notifyListeners();
    }
  }

  void sendReply() {
    if (isReplying && replyIndex != -1 && commentController.text.trim().isNotEmpty) {
      replies[replyIndex].add(commentController.text.trim());
    }
    isReplying = false;
    isEditingReply = false;
    replyIndex = -1;
    commentController.clear();
    notifyListeners();
  }

  void editReply(int commentIndex, String oldReply) {
    if (commentIndex >= 0 && commentIndex < replies.length) {
      isReplying = true;
      isEditingReply = true;
      replyIndex = commentIndex;
      commentController.text = oldReply;
      notifyListeners();
    }
  }

  void deleteReply(int commentIndex, String reply) {
    if (commentIndex >= 0 && commentIndex < replies.length) {
      replies[commentIndex].remove(reply);
      notifyListeners();
    }
  }
}
