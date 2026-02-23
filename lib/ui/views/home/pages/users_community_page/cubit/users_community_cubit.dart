import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'users_community_state.dart';

class UsersCommunityCubit extends Cubit<UsersCommunityState> {
  UsersCommunityCubit() : super(UsersCommunityInitial());
}
