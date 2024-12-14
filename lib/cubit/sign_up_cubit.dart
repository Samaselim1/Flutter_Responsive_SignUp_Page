import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial(name: '', email: '', phoneNumber: '', password: ''));

  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> SignUpSubmit(SignUpInitial userDetails) async {
    emit(SignUpLoading());

    try {
      await _auth.createUserWithEmailAndPassword(email: userDetails.email, password: userDetails.password);
        emit(SignUpSuccess());

    } catch (e)
    {
      emit(SignUpFailed(error: e.toString()));
    }
    // final bool validCredentials = userDetails.name.isNotEmpty &&
    //     userDetails.email.contains('@') &&
    //     userDetails.phoneNumber.length >= 6 &&
    //     userDetails.password.length >= 4;
    //
    // if (validCredentials) {
    //   emit(SignUpSuccess());
    // } else {
    //   emit(SignUpFailed());
    // }
  }
}
