enum AppRouteEnum {
  signIn(
    name: 'signIn',
    path: '/signIn',
  ),
  dashboard(
    name: 'dashboard',
    path: 'dashboard',
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
