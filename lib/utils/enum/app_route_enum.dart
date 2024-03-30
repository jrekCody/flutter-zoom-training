enum AppRouteEnum {
  splash(
    name: 'splash',
    path: '/splash',
  ),
  signIn(
    name: 'signIn',
    path: '/signIn',
  ),
  newMeet(
    name: 'newMeet',
    path: '/newMeet',
  ),
  meetings(
    name: 'meetings',
    path: '/meetings',
  ),
  contacts(
    name: 'contacts',
    path: '/contacts',
  ),
  settings(
    name: 'settings',
    path: '/settings',
  );

  const AppRouteEnum({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => 'name: $name, path: $path';
}
