import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/widgets/pop_messages.dart';
import 'package:ulearning_app/features/sign_up/provider/register_notifier.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../main.dart';
import '../repo/sign_up_repo.dart';


class SignUpController{
  late WidgetRef ref;

   SignUpController({required this.ref});

   void handleSignUp() async {
     var state = ref.read(registerNotifierProvider);
     String name = state.userName;
     String email = state.email;
     String password =state.password;
     String rePassword = state.rePassword;


     if(state.userName.length<6 || name.length<6 ){
       toastInfo("Your name is too  short");
       return;
     }
     if(state.userName.isEmpty || name.isEmpty ){
       toastInfo("Your name is empty");
       return;
     }

     if(state.email.isEmpty || email.isEmpty ){
       toastInfo("Your email is empty");
       return;
     }

     if((state.rePassword.isEmpty || state.password.isEmpty)|| rePassword.isEmpty || password.isEmpty){
       toastInfo("Your Password is empty");
     }

     if((state.rePassword!=state.password)|| rePassword!= password){
       toastInfo("Your Password did not match");
     }

     ref.read(appLoaderProvider.notifier).setLoaderValue(true);

     Future.delayed(const Duration(seconds: 2),() async {
       //var context = Navigator.of(ref.context);
       try{
         final credentiel = await SingUpRepo.firebaseSignUp(email, password);

         if(kDebugMode){
           print(credentiel);
         }
         if(credentiel.user!=null){
           await credentiel.user?.sendEmailVerification();
           await credentiel.user?.updateDisplayName(name);
           toastInfo("Asn email has been to verify your account. please open that email and verify");
          // context.pop();
           navKey.currentState?.pop();
         }
       } on FirebaseAuthException catch(e) {
         if (e.code == "weak-password") {
           toastInfo("this password is too week");
         } else if (e.code == "email-already-in-use") {
           toastInfo("this email address has already been registered");
         } else if (e.code == "user-not-found") {
           toastInfo("user not found ");
         }
       }catch(e){
         if(kDebugMode){
           print(e.toString());
         }
         ref.watch(appLoaderProvider.notifier).setLoaderValue(false);
       }
     });

   }
}