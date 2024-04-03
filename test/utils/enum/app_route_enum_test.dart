import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zoom/utils/enum/app_route_enum.dart';

void main() {
  test('AppRouteEnum property name is correctly set', () {
    expect(AppRouteEnum.splash.name, 'splash');
    expect(AppRouteEnum.signIn.name, 'signIn');
    expect(AppRouteEnum.newMeet.name, 'newMeet');
    expect(AppRouteEnum.joinMeet.name, 'joinMeet');
    expect(AppRouteEnum.meetings.name, 'meetings');
    expect(AppRouteEnum.contacts.name, 'contacts');
    expect(AppRouteEnum.settings.name, 'settings');
  });

  test('AppRouteEnum property path is correctly set', () {
    expect(AppRouteEnum.splash.path, '/splash');
    expect(AppRouteEnum.signIn.path, '/signIn');
    expect(AppRouteEnum.newMeet.path, '/newMeet');
    expect(AppRouteEnum.joinMeet.path, 'joinMeet');
    expect(AppRouteEnum.meetings.path, '/meetings');
    expect(AppRouteEnum.contacts.path, '/contacts');
    expect(AppRouteEnum.settings.path, '/settings');
  });
}
