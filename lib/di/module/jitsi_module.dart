import 'package:injectable/injectable.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';

@module
abstract class JitsiModule{
  @singleton
  JitsiMeet get jitsiMeet => JitsiMeet();
}