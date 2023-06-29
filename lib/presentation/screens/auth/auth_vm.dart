import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:tasklet/data/models/models.dart';
import 'package:tasklet/domain/services/auth_service.dart';
import 'package:tasklet/presentation/screens/auth/enums/auth_enum.dart';

class AuthViewModel extends BaseViewModel {
  AuthViewModel({
    required this.authService,
  });

  final AuthService authService;
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final nameController = TextEditingController();

  bool codeSended = false;
  UserAuthModel? reqCodeResp;
  AuthEnum currentPage = AuthEnum.auth;

  Future<void> onReady() async {}

  void pushToSignin() {
    currentPage = AuthEnum.signIn;
    codeSended = false;
    emailController.clear();
    codeController.clear();
    nameController.clear();
    notifyListeners();
  }

  void pushToSignUp() {
    currentPage = AuthEnum.signUp;
    codeSended = false;
    emailController.clear();
    codeController.clear();
    nameController.clear();
    notifyListeners();
  }

  void pop() {
    currentPage = AuthEnum.auth;
    codeSended = false;
    emailController.clear();
    codeController.clear();
    nameController.clear();
    notifyListeners();
  }

  Future<void> requestCode() async {
    reqCodeResp = await authService.auth(
      UserAuthDto(email: emailController.text),
    );
    if (reqCodeResp == null) return;
    codeSended = true;
    notifyListeners();
  }

  Future<void> requestCodeWithSignUp() async {
    reqCodeResp = await authService.auth(
      UserAuthDto(
        email: emailController.text,
        userName: nameController.text,
      ),
    );
    if (reqCodeResp == null) return;
    codeSended = true;
    notifyListeners();
  }

  Future<void> approveCode() async {
    final res = await authService.confirm(
      UserConfirmDto(
        code: reqCodeResp?.code ?? '',
        mailCode: codeController.text.toUpperCase(),
      ),
    );
    if (res == null) return;
  }

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    nameController.dispose();
    super.dispose();
  }
}
