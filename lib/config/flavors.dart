enum Flavor {
  dev,
  stg,
  prod;

  String get title {
    switch (this) {
      case Flavor.dev:
        return '[DEV] Flutter Base';
      case Flavor.stg:
        return '[STG] Flutter Base';
      case Flavor.prod:
        return 'Flutter Base';
    }
  }
}

Flavor? appFlavor;
