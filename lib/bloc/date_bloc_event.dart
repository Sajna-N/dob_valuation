abstract class DobEvent {}

class DobDateChanged extends DobEvent {
  final String date;

  DobDateChanged({required this.date});
}
