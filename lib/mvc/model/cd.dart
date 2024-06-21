class Cd {
    Cd({
        required this.name,
        required this.capital,
        required this.region,
        required this.subregion,
        required this.languages,
        required this.landlocked,
        required this.area,
        required this.flag,
        required this.population,
        required this.continents,
        required this.flags,
        required this.coatOfArms,
    });

    final Name? name;
    static const String nameKey = "name";
    
    final List<String> capital;
    static const String capitalKey = "capital";
    
    final String region;
    static const String regionKey = "region";
    
    final String subregion;
    static const String subregionKey = "subregion";
    
    final Languages? languages;
    static const String languagesKey = "languages";
    
    final bool landlocked;
    static const String landlockedKey = "landlocked";
    
    final num area;
    static const String areaKey = "area";
    
    final String flag;
    static const String flagKey = "flag";
    
    final num population;
    static const String populationKey = "population";
    
    final List<String> continents;
    static const String continentsKey = "continents";
    
    final Flags? flags;
    static const String flagsKey = "flags";
    
    final CoatOfArms? coatOfArms;
    static const String coatOfArmsKey = "coatOfArms";
    

    Cd copyWith({
        Name? name,
        List<String>? capital,
        String? region,
        String? subregion,
        Languages? languages,
        bool? landlocked,
        num? area,
        String? flag,
        num? population,
        List<String>? continents,
        Flags? flags,
        CoatOfArms? coatOfArms,
    }) {
        return Cd(
            name: name ?? this.name,
            capital: capital ?? this.capital,
            region: region ?? this.region,
            subregion: subregion ?? this.subregion,
            languages: languages ?? this.languages,
            landlocked: landlocked ?? this.landlocked,
            area: area ?? this.area,
            flag: flag ?? this.flag,
            population: population ?? this.population,
            continents: continents ?? this.continents,
            flags: flags ?? this.flags,
            coatOfArms: coatOfArms ?? this.coatOfArms,
        );
    }

    factory Cd.fromJson(Map<String, dynamic> json){ 
        return Cd(
            name: json["name"] == null ? null : Name.fromJson(json["name"]),
            capital: json["capital"] == null ? [] : List<String>.from(json["capital"]!.map((x) => x)),
            region: json["region"] ?? "",
            subregion: json["subregion"] ?? "",
            languages: json["languages"] == null ? null : Languages.fromJson(json["languages"]),
            landlocked: json["landlocked"] ?? false,
            area: json["area"] ?? 0,
            flag: json["flag"] ?? "",
            population: json["population"] ?? 0,
            continents: json["continents"] == null ? [] : List<String>.from(json["continents"]!.map((x) => x)),
            flags: json["flags"] == null ? null : Flags.fromJson(json["flags"]),
            coatOfArms: json["coatOfArms"] == null ? null : CoatOfArms.fromJson(json["coatOfArms"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name?.toJson(),
        "capital": capital.map((x) => x).toList(),
        "region": region,
        "subregion": subregion,
        "languages": languages?.toJson(),
        "landlocked": landlocked,
        "area": area,
        "flag": flag,
        "population": population,
        "continents": continents.map((x) => x).toList(),
        "flags": flags?.toJson(),
        "coatOfArms": coatOfArms?.toJson(),
    };

    @override
    String toString(){
        return "$name, $capital, $region, $subregion, $languages, $landlocked, $area, $flag, $population, $continents, $flags, $coatOfArms, ";
    }
}

class CoatOfArms {
    CoatOfArms({
        required this.png,
        required this.svg,
    });

    final String png;
    static const String pngKey = "png";
    
    final String svg;
    static const String svgKey = "svg";
    

    CoatOfArms copyWith({
        String? png,
        String? svg,
    }) {
        return CoatOfArms(
            png: png ?? this.png,
            svg: svg ?? this.svg,
        );
    }

    factory CoatOfArms.fromJson(Map<String, dynamic> json){ 
        return CoatOfArms(
            png: json["png"] ?? "",
            svg: json["svg"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
    };

    @override
    String toString(){
        return "$png, $svg, ";
    }
}

class Flags {
    Flags({
        required this.png,
    });

    final String png;
    static const String pngKey = "png";
    

    Flags copyWith({
        String? png,
    }) {
        return Flags(
            png: png ?? this.png,
        );
    }

    factory Flags.fromJson(Map<String, dynamic> json){ 
        return Flags(
            png: json["png"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "png": png,
    };

    @override
    String toString(){
        return "$png, ";
    }
}

class Languages {
    Languages({
        required this.fra,
    });

    final String fra;
    static const String fraKey = "fra";
    

    Languages copyWith({
        String? fra,
    }) {
        return Languages(
            fra: fra ?? this.fra,
        );
    }

    factory Languages.fromJson(Map<String, dynamic> json){ 
        return Languages(
            fra: json["fra"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "fra": fra,
    };

    @override
    String toString(){
        return "$fra, ";
    }
}

class Name {
    Name({
        required this.common,
        required this.official,
        required this.nativeName,
    });

    final String common;
    static const String commonKey = "common";
    
    final String official;
    static const String officialKey = "official";
    
    final NativeName? nativeName;
    static const String nativeNameKey = "nativeName";
    

    Name copyWith({
        String? common,
        String? official,
        NativeName? nativeName,
    }) {
        return Name(
            common: common ?? this.common,
            official: official ?? this.official,
            nativeName: nativeName ?? this.nativeName,
        );
    }

    factory Name.fromJson(Map<String, dynamic> json){ 
        return Name(
            common: json["common"] ?? "",
            official: json["official"] ?? "",
            nativeName: json["nativeName"] == null ? null : NativeName.fromJson(json["nativeName"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": nativeName?.toJson(),
    };

    @override
    String toString(){
        return "$common, $official, $nativeName, ";
    }
}

class NativeName {
    NativeName({
        required this.fra,
    });

    final Fra? fra;
    static const String fraKey = "fra";
    

    NativeName copyWith({
        Fra? fra,
    }) {
        return NativeName(
            fra: fra ?? this.fra,
        );
    }

    factory NativeName.fromJson(Map<String, dynamic> json){ 
        return NativeName(
            fra: json["fra"] == null ? null : Fra.fromJson(json["fra"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "fra": fra?.toJson(),
    };

    @override
    String toString(){
        return "$fra, ";
    }
}

class Fra {
    Fra({
        required this.official,
        required this.common,
    });

    final String official;
    static const String officialKey = "official";
    
    final String common;
    static const String commonKey = "common";
    

    Fra copyWith({
        String? official,
        String? common,
    }) {
        return Fra(
            official: official ?? this.official,
            common: common ?? this.common,
        );
    }

    factory Fra.fromJson(Map<String, dynamic> json){ 
        return Fra(
            official: json["official"] ?? "",
            common: json["common"] ?? "",
        );
    }

    Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
    };

    @override
    String toString(){
        return "$official, $common, ";
    }
}
