import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/repos/user_repo/user_repo.dart';
import '../../models/User_Model.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit({required this.userRepo}) : super(UserInitial());
  UserRepo userRepo;

  Future<void> getUserData() async {
    emit(FetchUserDataLoading());
    final result = await userRepo.getUserData();
    result.fold(
      (l) => emit(FetchUserDataFailure(errMessage: l.errmessage)),
      (r) => emit(FetchUserDataSuccess(userModel: r)),
    );
  }
}
