
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/profile_repo.dart';

import 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  static ProfileCubit get(context) => BlocProvider.of(context);
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());
  Future<void> getProfile() async {
    emit(ProfileState.loading());
    try {
      final response = await _profileRepo.getProfile();
      emit(ProfileState.loaded(response));
    } catch (e) {
      emit(ProfileState.error(error: (e.toString())));
    }
  }
}