class Ninja {
  final String name;

  final String affinity;

  final String clan;

  const Ninja(this.name, this.affinity, this.clan);

  Ninja.fromJson(Map<String, Object?> json)
      : name = json['name'] as String,
        affinity = json['affinity'] as String,
        clan = json['clan'] as String;

  Map<String, Object?> toJson() => {
        'name': name,
        'affinity': affinity,
        'clan': clan,
      };

  @override
  String toString() => 'Ninja(name: $name, affinity: $affinity, clan: $clan)';

  @override
  bool operator ==(covariant Ninja other) {
    if (identical(this, other)) return true;

    return other.name == name && other.affinity == affinity && other.clan == clan;
  }

  @override
  int get hashCode => name.hashCode ^ affinity.hashCode ^ clan.hashCode;
}
