// To parse this JSON data, do
//
//     final homeResponseModel = homeResponseModelFromJson(jsonString);

import 'dart:convert';

HomeResponseModel homeResponseModelFromJson(String str) => HomeResponseModel.fromJson(json.decode(str));

String homeResponseModelToJson(HomeResponseModel data) => json.encode(data.toJson());

class HomeResponseModel {
    Fairings? fairings;
    Links? links;
    DateTime? staticFireDateUtc;
    int? staticFireDateUnix;
    bool? net;
    int? window;
    String? rocket;
    bool? success;
    List<Failure>? failures;
    String? details;
    List<dynamic>? crew;
    List<dynamic>? ships;
    List<dynamic>? capsules;
    List<String>? payloads;
    String? launchpad;
    int? flightNumber;
    String? name;
    DateTime? dateUtc;
    int? dateUnix;
    DateTime? dateLocal;
    String? datePrecision;
    bool? upcoming;
    List<Core>? cores;
    bool? autoUpdate;
    bool? tbd;
    dynamic launchLibraryId;
    String? id;

    HomeResponseModel({
        this.fairings,
        this.links,
        this.staticFireDateUtc,
        this.staticFireDateUnix,
        this.net,
        this.window,
        this.rocket,
        this.success,
        this.failures,
        this.details,
        this.crew,
        this.ships,
        this.capsules,
        this.payloads,
        this.launchpad,
        this.flightNumber,
        this.name,
        this.dateUtc,
        this.dateUnix,
        this.dateLocal,
        this.datePrecision,
        this.upcoming,
        this.cores,
        this.autoUpdate,
        this.tbd,
        this.launchLibraryId,
        this.id,
    });

    factory HomeResponseModel.fromJson(Map<String, dynamic> json) => HomeResponseModel(
        fairings: json["fairings"] == null ? null : Fairings.fromJson(json["fairings"]),
        links: json["links"] == null ? null : Links.fromJson(json["links"]),
        staticFireDateUtc: json["static_fire_date_utc"] == null ? null : DateTime.parse(json["static_fire_date_utc"]),
        staticFireDateUnix: json["static_fire_date_unix"],
        net: json["net"],
        window: json["window"],
        rocket: json["rocket"],
        success: json["success"],
        failures: json["failures"] == null ? [] : List<Failure>.from(json["failures"]!.map((x) => Failure.fromJson(x))),
        details: json["details"],
        crew: json["crew"] == null ? [] : List<dynamic>.from(json["crew"]!.map((x) => x)),
        ships: json["ships"] == null ? [] : List<dynamic>.from(json["ships"]!.map((x) => x)),
        capsules: json["capsules"] == null ? [] : List<dynamic>.from(json["capsules"]!.map((x) => x)),
        payloads: json["payloads"] == null ? [] : List<String>.from(json["payloads"]!.map((x) => x)),
        launchpad: json["launchpad"],
        flightNumber: json["flight_number"],
        name: json["name"],
        dateUtc: json["date_utc"] == null ? null : DateTime.parse(json["date_utc"]),
        dateUnix: json["date_unix"],
        dateLocal: json["date_local"] == null ? null : DateTime.parse(json["date_local"]),
        datePrecision: json["date_precision"],
        upcoming: json["upcoming"],
        cores: json["cores"] == null ? [] : List<Core>.from(json["cores"]!.map((x) => Core.fromJson(x))),
        autoUpdate: json["auto_update"],
        tbd: json["tbd"],
        launchLibraryId: json["launch_library_id"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "fairings": fairings?.toJson(),
        "links": links?.toJson(),
        "static_fire_date_utc": staticFireDateUtc?.toIso8601String(),
        "static_fire_date_unix": staticFireDateUnix,
        "net": net,
        "window": window,
        "rocket": rocket,
        "success": success,
        "failures": failures == null ? [] : List<dynamic>.from(failures!.map((x) => x.toJson())),
        "details": details,
        "crew": crew == null ? [] : List<dynamic>.from(crew!.map((x) => x)),
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
        "capsules": capsules == null ? [] : List<dynamic>.from(capsules!.map((x) => x)),
        "payloads": payloads == null ? [] : List<dynamic>.from(payloads!.map((x) => x)),
        "launchpad": launchpad,
        "flight_number": flightNumber,
        "name": name,
        "date_utc": dateUtc?.toIso8601String(),
        "date_unix": dateUnix,
        "date_local": dateLocal?.toIso8601String(),
        "date_precision": datePrecision,
        "upcoming": upcoming,
        "cores": cores == null ? [] : List<dynamic>.from(cores!.map((x) => x.toJson())),
        "auto_update": autoUpdate,
        "tbd": tbd,
        "launch_library_id": launchLibraryId,
        "id": id,
    };
}

class Core {
    String? core;
    int? flight;
    bool? gridfins;
    bool? legs;
    bool? reused;
    bool? landingAttempt;
    dynamic landingSuccess;
    dynamic landingType;
    dynamic landpad;

    Core({
        this.core,
        this.flight,
        this.gridfins,
        this.legs,
        this.reused,
        this.landingAttempt,
        this.landingSuccess,
        this.landingType,
        this.landpad,
    });

    factory Core.fromJson(Map<String, dynamic> json) => Core(
        core: json["core"],
        flight: json["flight"],
        gridfins: json["gridfins"],
        legs: json["legs"],
        reused: json["reused"],
        landingAttempt: json["landing_attempt"],
        landingSuccess: json["landing_success"],
        landingType: json["landing_type"],
        landpad: json["landpad"],
    );

    Map<String, dynamic> toJson() => {
        "core": core,
        "flight": flight,
        "gridfins": gridfins,
        "legs": legs,
        "reused": reused,
        "landing_attempt": landingAttempt,
        "landing_success": landingSuccess,
        "landing_type": landingType,
        "landpad": landpad,
    };
}

class Failure {
    int? time;
    dynamic altitude;
    String? reason;

    Failure({
        this.time,
        this.altitude,
        this.reason,
    });

    factory Failure.fromJson(Map<String, dynamic> json) => Failure(
        time: json["time"],
        altitude: json["altitude"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "time": time,
        "altitude": altitude,
        "reason": reason,
    };
}

class Fairings {
    bool? reused;
    bool? recoveryAttempt;
    bool? recovered;
    List<dynamic>? ships;

    Fairings({
        this.reused,
        this.recoveryAttempt,
        this.recovered,
        this.ships,
    });

    factory Fairings.fromJson(Map<String, dynamic> json) => Fairings(
        reused: json["reused"],
        recoveryAttempt: json["recovery_attempt"],
        recovered: json["recovered"],
        ships: json["ships"] == null ? [] : List<dynamic>.from(json["ships"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "reused": reused,
        "recovery_attempt": recoveryAttempt,
        "recovered": recovered,
        "ships": ships == null ? [] : List<dynamic>.from(ships!.map((x) => x)),
    };
}

class Links {
    Patch? patch;
    Reddit? reddit;
    Flickr? flickr;
    dynamic presskit;
    String? webcast;
    String? youtubeId;
    String? article;
    String? wikipedia;

    Links({
        this.patch,
        this.reddit,
        this.flickr,
        this.presskit,
        this.webcast,
        this.youtubeId,
        this.article,
        this.wikipedia,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        patch: json["patch"] == null ? null : Patch.fromJson(json["patch"]),
        reddit: json["reddit"] == null ? null : Reddit.fromJson(json["reddit"]),
        flickr: json["flickr"] == null ? null : Flickr.fromJson(json["flickr"]),
        presskit: json["presskit"],
        webcast: json["webcast"],
        youtubeId: json["youtube_id"],
        article: json["article"],
        wikipedia: json["wikipedia"],
    );

    Map<String, dynamic> toJson() => {
        "patch": patch?.toJson(),
        "reddit": reddit?.toJson(),
        "flickr": flickr?.toJson(),
        "presskit": presskit,
        "webcast": webcast,
        "youtube_id": youtubeId,
        "article": article,
        "wikipedia": wikipedia,
    };
}

class Flickr {
    List<dynamic>? small;
    List<dynamic>? original;

    Flickr({
        this.small,
        this.original,
    });

    factory Flickr.fromJson(Map<String, dynamic> json) => Flickr(
        small: json["small"] == null ? [] : List<dynamic>.from(json["small"]!.map((x) => x)),
        original: json["original"] == null ? [] : List<dynamic>.from(json["original"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "small": small == null ? [] : List<dynamic>.from(small!.map((x) => x)),
        "original": original == null ? [] : List<dynamic>.from(original!.map((x) => x)),
    };
}

class Patch {
    String? small;
    String? large;

    Patch({
        this.small,
        this.large,
    });

    factory Patch.fromJson(Map<String, dynamic> json) => Patch(
        small: json["small"],
        large: json["large"],
    );

    Map<String, dynamic> toJson() => {
        "small": small,
        "large": large,
    };
}

class Reddit {
    dynamic campaign;
    dynamic launch;
    dynamic media;
    dynamic recovery;

    Reddit({
        this.campaign,
        this.launch,
        this.media,
        this.recovery,
    });

    factory Reddit.fromJson(Map<String, dynamic> json) => Reddit(
        campaign: json["campaign"],
        launch: json["launch"],
        media: json["media"],
        recovery: json["recovery"],
    );

    Map<String, dynamic> toJson() => {
        "campaign": campaign,
        "launch": launch,
        "media": media,
        "recovery": recovery,
    };
}
