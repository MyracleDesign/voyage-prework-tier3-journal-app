class NoteModel {
  final String noteId;
  final String headText;
  final String bodyText;

  NoteModel({this.noteId, this.headText, this.bodyText});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      noteId: json["noteId"],
      headText: json["headText"],
      bodyText: json["bodyText"],
    );
  }
}
