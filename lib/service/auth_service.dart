import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

enum AUTHSTATUS { UNINITIALIZED, UNAUTHENTICATED, AUTHENTICATED }

enum LOGINSTATUS {
  UNINITIALIZED,
  VERIFYINGPHONE,
  VERIFYPHONEFAILED,
  SMSCODESENT,
  VERIFYINGCODE,
  VERIFYCODEFAILED
}

class AuthService extends ChangeNotifier {
  FirebaseAuth _auth;
  FirebaseUser _user;
  AuthResult _authResult;
  String _phoneNumber;
  String _verificationId;
  String _errorCode;
  String _errorMessage;
  AUTHSTATUS _authStatus = AUTHSTATUS.UNINITIALIZED;
  LOGINSTATUS _loginStatus = LOGINSTATUS.UNINITIALIZED;
  UserUpdateInfo userUpdateInfo = UserUpdateInfo();

  AuthService.instance() : _auth = FirebaseAuth.instance {
    _authStatus = AUTHSTATUS.UNINITIALIZED;
    _loginStatus = LOGINSTATUS.UNINITIALIZED;
    _verificationId = '';
    _user = null;
    _errorCode = '';
    _errorMessage = '';

    _auth.onAuthStateChanged.listen((FirebaseUser firebaseUser) async {
      if (firebaseUser == null) {
        _authStatus = AUTHSTATUS.UNAUTHENTICATED;
        _phoneNumber = '';
        _verificationId = '';
        _user = null;
        _errorCode = '';
        _errorMessage = '';
        notifyListeners();
      } else {
        _user = firebaseUser;
        _authStatus = AUTHSTATUS.AUTHENTICATED;
        _phoneNumber = '';
        _verificationId = '';
        _user = firebaseUser;
        _errorCode = '';
        _errorMessage = '';
        notifyListeners();
      }
    });
  }

  AUTHSTATUS get authStatus => _authStatus;
  LOGINSTATUS get loginStatus => _loginStatus;
  String get phoneNumber => _phoneNumber;
  String get verificationId => _verificationId;
  String get errorCode => _errorCode;
  String get errorMessage => _errorMessage;
  FirebaseUser get user => _user;

  Future<void> verifyPhoneNumber(String phoneNumber) async {
    _loginStatus = LOGINSTATUS.VERIFYINGPHONE;
    _phoneNumber = phoneNumber;
    _verificationId = '';
    _user = null;
    _errorCode = '';
    _errorMessage = '';
    notifyListeners();

    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) async {
      _authResult = await _auth.signInWithCredential(phoneAuthCredential);
      _user = _authResult.user;
      _verificationId = '';
      _user = _authResult.user;
      _errorCode = '';
      _errorMessage = '';
      notifyListeners();
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      _loginStatus = LOGINSTATUS.VERIFYPHONEFAILED;
      _verificationId = '';
      _user = null;
      _errorCode = authException.code;
      _errorMessage = authException.message;
      notifyListeners();
      Future.delayed(Duration(seconds: 1),(){
        _loginStatus = LOGINSTATUS.UNINITIALIZED;
      });
      notifyListeners();
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
            _loginStatus = LOGINSTATUS.SMSCODESENT;
      _verificationId = verificationId;
      _user = null;
      _errorCode = '';
      _errorMessage = '';
      notifyListeners();
      
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      // _verificationId = verificationId;
      // _loginStatus = LOGINSTATUS.SMSCODESENT;
      // _verificationId = verificationId;
      // _user = null;
      // _errorCode = '';
      // _errorMessage = '';
      // notifyListeners();
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }


  

  Future<void> signInWithPhoneNumber(String smsCode) async {
    _loginStatus = LOGINSTATUS.VERIFYINGCODE;
        _user = null;
    _errorCode = '';
    _errorMessage = '';
    notifyListeners();
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      _authResult = await _auth.signInWithCredential(credential);
      final FirebaseUser user = _authResult.user;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      _authStatus = AUTHSTATUS.AUTHENTICATED;
      _verificationId = '';
      _user = _authResult.user;
      _errorCode = '';
      _errorMessage = '';
      notifyListeners();
    } on PlatformException catch (e) {
      _loginStatus = LOGINSTATUS.VERIFYCODEFAILED;
            _user = null;
      _errorCode = e.code;
      _errorMessage = e.message;
      notifyListeners();
      Future.delayed(Duration(seconds: 1),(){
        _loginStatus = LOGINSTATUS.SMSCODESENT;
        notifyListeners();
      });
      
    }
  }

  void restartVerification(){
    _loginStatus = LOGINSTATUS.UNINITIALIZED;
    _verificationId = '';
    _user = null;
    _errorCode = '';
    _errorMessage = '';
    notifyListeners();
  }

  // Future<FirebaseUser> getCurrentUser() async {
  //   FirebaseUser firebaseUser = await _auth.currentUser();
  //   return firebaseUser;
  // }

  // Future<void> setDisplayName(String displayName) async {
  //   userUpdateInfo.displayName = displayName;
  //   notifyListeners();
  // }

  // resetErrorCodeAndMessage(){
  //   _errorCode = '';
  //   _errorMessage = '';
  //   notifyListeners();
  // }

  Future signOut() async {
    _auth.signOut();
    _authStatus = AUTHSTATUS.UNAUTHENTICATED;
    _loginStatus = LOGINSTATUS.UNINITIALIZED;
    notifyListeners();
    return Future.delayed(Duration.zero);
  }
}
