extension MapExtension<K, V> on Map<K, V> {
  V? getOrElse(K key, V defaultValue) {
    return this[key] ?? defaultValue;
  }
}

