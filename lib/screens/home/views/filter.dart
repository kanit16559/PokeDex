class Filter {
  final String title;
  final String event;
  const Filter({required this.title, required this.event});
}
const List<Filter> choices = const <Filter>[
  const Filter(title: 'A-Z', event: 'a_z'),
  const Filter(title: 'Z-A', event: 'z_a'),
  const Filter(title: 'No.', event: 'no'),
];
