import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AWSServices {
  final userPool = CognitoUserPool(
    '${(dotenv.env['POOL_ID'])}',
    '${(dotenv.env['CLIENT_ID'])}',
  );

  Future createInitialRecord(email, password) async {
    debugPrint('Authenticating User...');
    final cognitoUser = CognitoUser(email, userPool);
    final authDetails = AuthenticationDetails(
      username: email,
      password: password,
    );
    CognitoUserSession? session;
    try {
      session = await cognitoUser.authenticateUser(authDetails);
      debugPrint('Login Success...');
    } on CognitoUserNewPasswordRequiredException catch (e) {
      debugPrint('CognitoUserNewPasswordRequiredException $e');
    } on CognitoUserMfaRequiredException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserSelectMfaTypeException catch (e) {
      debugPrint('CognitoUserMfaRequiredException $e');
    } on CognitoUserMfaSetupException catch (e) {
      debugPrint('CognitoUserMfaSetupException $e');
    } on CognitoUserTotpRequiredException catch (e) {
      debugPrint('CognitoUserTotpRequiredException $e');
    } on CognitoUserCustomChallengeException catch (e) {
      debugPrint('CognitoUserCustomChallengeException $e');
    } on CognitoUserConfirmationNecessaryException catch (e) {
      debugPrint('CognitoUserConfirmationNecessaryException $e');
    } on CognitoClientException catch (e) {
      debugPrint('CognitoClientException $e');
    } catch (e) {
      print(e);
    }
  }
}
