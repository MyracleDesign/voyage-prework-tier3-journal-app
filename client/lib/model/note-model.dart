class NoteModel {
  final int noteId;
  final String headerText;
  final String bodyText;

  NoteModel({this.noteId, this.headerText, this.bodyText});

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      noteId: json["noteId"],
      headerText: json["headerText"],
      bodyText: json["bodyText"],
    );
  }
}
