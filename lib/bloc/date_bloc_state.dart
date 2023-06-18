class DobState {
  final String dateFormatted;

  DobState({required this.dateFormatted});

  DobState copyWith({String? dateFormatted}) {
    return DobState(dateFormatted: dateFormatted ?? this.dateFormatted);
  }
}
