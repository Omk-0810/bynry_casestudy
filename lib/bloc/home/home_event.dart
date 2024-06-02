part of 'home_bloc.dart';


@immutable
sealed class HomeEvent {
}


 final class FormSubmitting extends HomeEvent {
}

final class NavigationClicked extends HomeEvent{
 final int index;

 NavigationClicked(this.index);
}

class LoadUsername extends HomeEvent {}
final class LogoutClicked extends HomeEvent{
}

final class ChatbotClicked extends HomeEvent {
}


