
part of 'home_bloc.dart';


@immutable
sealed class HomeState {
}

class HomeInitial extends HomeState {
  final int selectedIndex;

  HomeInitial(this.selectedIndex);
}
class NavigationState extends HomeState {
  final int selectedIndex;
  final String? username;


  NavigationState(this.selectedIndex, {this.username});
}
class UsernameLoaded extends HomeState {
  final String username;
  UsernameLoaded(this.username);

}
