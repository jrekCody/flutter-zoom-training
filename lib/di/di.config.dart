// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:flutter_zoom/data/model/mapper/meeting_mapper.dart' as _i7;
import 'package:flutter_zoom/data/repository/auth_repository.dart' as _i12;
import 'package:flutter_zoom/data/repository/impl/auth_repository_impl.dart'
    as _i13;
import 'package:flutter_zoom/data/repository/impl/jitsi_repository_impl.dart'
    as _i11;
import 'package:flutter_zoom/data/repository/impl/user_repository_impl.dart'
    as _i9;
import 'package:flutter_zoom/data/repository/jitsi_repository.dart' as _i10;
import 'package:flutter_zoom/data/repository/user_repository.dart' as _i8;
import 'package:flutter_zoom/di/module/firebae_module.dart' as _i18;
import 'package:flutter_zoom/di/module/jitsi_module.dart' as _i19;
import 'package:flutter_zoom/feature/auth/sign_in/bloc/auth_bloc.dart' as _i14;
import 'package:flutter_zoom/feature/meet_chat/join_meeting/bloc/join_meeting_bloc.dart'
    as _i15;
import 'package:flutter_zoom/feature/meet_chat/new_meeting/bloc/new_meeting_bloc.dart'
    as _i17;
import 'package:flutter_zoom/feature/meeting/bloc/meeting_bloc.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:google_sign_in/google_sign_in.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt initDi({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    final jitsiModule = _$JitsiModule();
    gh.singleton<_i3.GoogleSignIn>(() => firebaseModule.googleSignIn);
    gh.singleton<_i4.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.singleton<_i5.FirebaseFirestore>(() => firebaseModule.firebaseFirestore);
    gh.singleton<_i6.JitsiMeet>(() => jitsiModule.jitsiMeet);
    gh.lazySingleton<_i7.MeetingMapper>(() => _i7.MeetingMapper());
    gh.singleton<_i8.UserRepository>(
        () => _i9.UserRepositoryImpl(gh<_i5.FirebaseFirestore>()));
    gh.singleton<_i10.JitsiRepository>(
        () => _i11.JitsiRepositoryImpl(jitsiMeet: gh<_i6.JitsiMeet>()));
    gh.singleton<_i12.AuthRepository>(() => _i13.AuthRepositoryImpl(
          gh<_i4.FirebaseAuth>(),
          gh<_i3.GoogleSignIn>(),
        ));
    gh.factory<_i14.AuthBloc>(() => _i14.AuthBloc(
          authRepository: gh<_i12.AuthRepository>(),
          userRepository: gh<_i8.UserRepository>(),
        ));
    gh.factory<_i15.JoinMeetingBloc>(() => _i15.JoinMeetingBloc(
          authRepository: gh<_i12.AuthRepository>(),
          jitsiRepository: gh<_i10.JitsiRepository>(),
        ));
    gh.factory<_i16.MeetingBloc>(() => _i16.MeetingBloc(
          userRepository: gh<_i8.UserRepository>(),
          authRepository: gh<_i12.AuthRepository>(),
          meetingMapper: gh<_i7.MeetingMapper>(),
        ));
    gh.factory<_i17.NewMeetingBloc>(() => _i17.NewMeetingBloc(
          jitsiRepository: gh<_i10.JitsiRepository>(),
          authRepository: gh<_i12.AuthRepository>(),
          userRepository: gh<_i8.UserRepository>(),
        ));
    return this;
  }
}

class _$FirebaseModule extends _i18.FirebaseModule {}

class _$JitsiModule extends _i19.JitsiModule {}
