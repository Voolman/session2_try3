import 'package:session2_try3/utlis.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

Future<void> signUp({
      required String password,
      required String email,
      required String phone,
      required String name,
      required Function onResponse,
      required Function onError
    }) async {
  try{
    var existNetwork = await checkNetworkConnection();
    if (!existNetwork){
      onError('Network error');
    }
    if (!isCorrectEmail(email)){
      onError('Почта не корректна');
    }
    List listName = name.split(" ");
    var result = await supabase.auth.signUp(
        password: password,
        email: email,
        data: {"lastname": listName[0], "firstname": listName[1], "patronymic": listName[2]}
    );
    onResponse(result);
  }on AuthException catch(e){
    onError(e.message);
  }
}

Future<void> signIn({
  required String password,
  required String email,
  required Function onResponse,
  required Function onError
}) async {
  try{
    var existNetwork = await checkNetworkConnection();
    if (!existNetwork){
      onError('Network error');
    }
    if (!isCorrectEmail(email)){
      onError('Почта не корректна');
    }
    var result = await supabase.auth.signInWithPassword(
        email: email,
        password: password
    );
    if (result.user == null){
      onError('User in null');
    } else{
      onResponse(result);
    }
  }on AuthException catch(e){
    onError(e.message);
  }
}

Future<void> signOut({
  required Function onResponse,
  required Function onError
}) async {
  try{
    await supabase.auth.signOut();
    onResponse();
  }on AuthException catch(e){
    onError(e.message);
  }
}

Future<void> sendOTP({
  required String email,
  required Function onResponse,
  required Function onError
}) async {
  try{
    var existNetwork = await checkNetworkConnection();
    if (!existNetwork){
      onError('Network error');
    }
    if (!isCorrectEmail(email)){
      onError('Почта не корректна');
    }
    await supabase.auth.resetPasswordForEmail(email);
    onResponse();
  }on AuthException catch(e){
    onError(e.message);
  }on Exception catch(e){
    onError('Something went wrong');
  }
}

Future<void> verifyOTP({
  required String email,
  required String code,
  required Function onResponse,
  required Function onError
}) async {
  try{
    await supabase.auth.verifyOTP(
        token: code,
        type: OtpType.email,
        email: email
    );
    onResponse();
  }on AuthException catch(e){
    onError(e.message);
  }on Exception catch(e){
    onError('Something went wrong');
  }
}

Future<void> changePassword({
  required String newPassword,
  required Function onResponse,
  required Function onError
}) async {
  try{
    await supabase.auth.updateUser(
      UserAttributes(
        password: newPassword
      )
    );
    onResponse();
  }on AuthException catch(e){
    onError(e.message);
  }on Exception catch(e){
    onError('Something went wrong');
  }
}