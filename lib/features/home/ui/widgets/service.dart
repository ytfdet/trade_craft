class Service {
  final String name;
  final String iconPath;

  const Service({
    required this.name,
    required this.iconPath,
  });

  static final List<Service> all = [
    const Service(
      name: 'التشطيبات',
      iconPath: 'assets/images/img_5.png',
    ),
    const Service(
      name: 'نجارة',
      iconPath: 'assets/images/img_3.png',
    ),
    const Service(
      name: 'سباكة',
      iconPath: 'assets/images/img_4.png',
    ),
    const Service(
      name: 'تكييفات',
      iconPath: 'assets/images/img_6.png',
    ),
    const Service(
      name: 'كهرياء',
      iconPath: 'assets/images/img_7.png',
    ),
    const Service(
      name: 'دهانات',
      iconPath: 'assets/images/img_8.png',
    ),
  ];
}