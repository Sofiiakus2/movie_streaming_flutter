class CommentModel{
    final String? id;
    final String authorId;
    final String text;
    final DateTime date;
    final List<CommentModel>? answers;

    CommentModel({
      this.id,
      required this.authorId,
      required this.text,
      required this.date,
      this.answers,
});

    Map<String, dynamic> toMap() {
      return {
        'id': id,
        'authorId': authorId,
        'text': text,
        'date': date.toIso8601String(),
        'answers': answers?.map((answer) => answer.toMap()).toList(),
      };
    }

    factory CommentModel.fromMap(Map<String, dynamic> map) {
      return CommentModel(
        id: map['id'],
        authorId: map['authorId'],
        text: map['text'],
        date: DateTime.parse(map['date']),
        answers: map['answers'] != null
            ? (map['answers'] as List)
            .map((answer) => CommentModel.fromMap(answer))
            .toList()
            : null,
      );
    }
}