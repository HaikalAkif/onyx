class TGVMovies {
  List<CinemaList>? cinemaList;
  List<MovieListFilter>? movieListFilter;

  TGVMovies({
    cinemaList,
    experienceList,
    movieListFilter,
    comingSoonMovieDetails,
  });

  TGVMovies.fromJson(Map<String, dynamic> json) {
    if (json['cinemaList'] != null) {
      cinemaList = <CinemaList>[];
      json['cinemaList'].forEach((v) {
        cinemaList!.add(CinemaList.fromJson(v));
      });
    }
    if (json['movieListFilter'] != null) {
      movieListFilter = <MovieListFilter>[];
      json['movieListFilter'].forEach((v) {
        movieListFilter!.add(MovieListFilter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (cinemaList != null) {
      data['cinemaList'] = cinemaList!.map((v) => v.toJson()).toList();
    }
    if (movieListFilter != null) {
      data['movieListFilter'] =
          movieListFilter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CinemaList {
  String? code;
  String? id;
  String? name;
  int? hallCount;
  int? seatingCapacity;
  String? address;
  double? latitude;
  double? longitude;
  bool? isOff;
  List<dynamic>? photos;
  List<MovieList>? movieList;
  String? urlSlug;
  String? mapUrl;

  CinemaList({
    code,
    id,
    name,
    hallCount,
    seatingCapacity,
    address,
    latitude,
    longitude,
    isOff,
    photos,
    movieList,
    urlSlug,
    mapUrl,
  });

  CinemaList.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    id = json['id'];
    name = json['name'];
    hallCount = json['hallCount'];
    seatingCapacity = json['seatingCapacity'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    isOff = json['isOff'];
    if (json['movieList'] != null) {
      movieList = <MovieList>[];
      json['movieList'].forEach((v) {
        movieList!.add(MovieList.fromJson(v));
      });
    }
    urlSlug = json['urlSlug'];
    mapUrl = json['mapUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    data['id'] = id;
    data['name'] = name;
    data['hallCount'] = hallCount;
    data['seatingCapacity'] = seatingCapacity;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['isOff'] = isOff;
    if (photos != null) {
      data['photos'] = photos!.map((v) => v.toJson()).toList();
    }
    if (movieList != null) {
      data['movieList'] = movieList!.map((v) => v.toJson()).toList();
    }
    data['urlSlug'] = urlSlug;
    data['mapUrl'] = mapUrl;
    return data;
  }
}

class MovieList {
  String? movieId;
  String? movieUrlSlug;
  String? movieName;
  int? movieDuration;
  MovieRating? movieRating;
  String? movieReleaseDate;
  Icon? moviePoster;
  List<String>? movieLanguage;
  MovieBanner? movieBanner;
  List<String>? movieExperience;
  List<ExperienceList>? experienceList;

  MovieList(
      {movieId,
      movieUrlSlug,
      movieName,
      movieGenres,
      movieDuration,
      movieRating,
      movieTrailerUrl,
      movieReleaseDate,
      moviePoster,
      movieLanguage,
      movieBanner,
      movieSubtitle,
      movieSynopsis,
      movieOffLocation,
      movieCastAndCrew,
      movieDirector,
      movieExperience,
      experienceList});

  MovieList.fromJson(Map<String, dynamic> json) {
    movieId = json['movieId'];
    movieUrlSlug = json['movieUrlSlug'];
    movieName = json['movieName'];
    movieDuration = json['movieDuration'];
    movieRating = json['movieRating'] != null
        ? MovieRating.fromJson(json['movieRating'])
        : null;
    movieReleaseDate = json['movieReleaseDate'];
    moviePoster =
        json['moviePoster'] != null ? Icon.fromJson(json['moviePoster']) : null;
    movieLanguage = json['movieLanguage'].cast<String>();
    movieBanner = json['movieBanner'] != null
        ? MovieBanner.fromJson(json['movieBanner'])
        : null;
    movieExperience = json['movieExperience'].cast<String>();
    if (json['experienceList'] != null) {
      experienceList = <ExperienceList>[];
      json['experienceList'].forEach((v) {
        experienceList!.add(ExperienceList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['movieId'] = movieId;
    data['movieUrlSlug'] = movieUrlSlug;
    data['movieName'] = movieName;
    data['movieDuration'] = movieDuration;
    if (movieRating != null) {
      data['movieRating'] = movieRating!.toJson();
    }
    data['movieReleaseDate'] = movieReleaseDate;
    if (moviePoster != null) {
      data['moviePoster'] = moviePoster!.toJson();
    }
    data['movieLanguage'] = movieLanguage;
    if (movieBanner != null) {
      data['movieBanner'] = movieBanner!.toJson();
    }
    data['movieExperience'] = movieExperience;
    if (experienceList != null) {
      data['experienceList'] = experienceList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MovieRating {
  String? id;
  String? name;
  Icon? icon;

  MovieRating({id, name, icon});

  MovieRating.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'] != null ? Icon.fromJson(json['icon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    if (icon != null) {
      data['icon'] = icon!.toJson();
    }
    return data;
  }
}

class Icon {
  String? original;

  Icon({original});

  Icon.fromJson(Map<String, dynamic> json) {
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['original'] = original;
    return data;
  }
}

class MovieBanner {
  String? original;
  String? movieDetails;
  String? homeBanner;
  String? appBanner;

  MovieBanner({original, movieDetails, homeBanner, appBanner});

  MovieBanner.fromJson(Map<String, dynamic> json) {
    original = json['original'];
    movieDetails = json['movie details'];
    homeBanner = json['home banner'];
    appBanner = json['app banner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['original'] = original;
    data['movie details'] = movieDetails;
    data['home banner'] = homeBanner;
    data['app banner'] = appBanner;
    return data;
  }
}

class ExperienceList {
  String? experienceId;
  Icon? experienceIcon;
  String? experienceName;
  String? experienceDescription;
  int? experienceSortOrder;
  List<Showtime>? showtime;

  ExperienceList(
      {experienceId,
      experienceIcon,
      experienceName,
      experienceDescription,
      experienceSortOrder,
      showtime});

  ExperienceList.fromJson(Map<String, dynamic> json) {
    experienceId = json['experienceId'];
    experienceIcon = json['experienceIcon'] != null
        ? Icon.fromJson(json['experienceIcon'])
        : null;
    experienceName = json['experienceName'];
    experienceDescription = json['experienceDescription'];
    experienceSortOrder = json['experienceSortOrder'];
    if (json['showtime'] != null) {
      showtime = <Showtime>[];
      json['showtime'].forEach((v) {
        showtime!.add(Showtime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['experienceId'] = experienceId;
    if (experienceIcon != null) {
      data['experienceIcon'] = experienceIcon!.toJson();
    }
    data['experienceName'] = experienceName;
    data['experienceDescription'] = experienceDescription;
    data['experienceSortOrder'] = experienceSortOrder;
    if (showtime != null) {
      data['showtime'] = showtime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Showtime {
  String? screenName;
  int? screenNumber;
  String? startTime;
  String? sessionId;
  String? hoCode;
  int? soldoutStatus;
  int? unavailabilityPercentage;
  String? advanceBookingDate;
  bool? isBookingOpenToGuest;

  Showtime(
      {screenName,
      screenNumber,
      startTime,
      sessionId,
      hoCode,
      soldoutStatus,
      unavailabilityPercentage,
      advanceBookingDate,
      loyaltyAdvanceBookingDate,
      isBookingOpenToGuest});

  Showtime.fromJson(Map<String, dynamic> json) {
    screenName = json['screenName'];
    screenNumber = json['screenNumber'];
    startTime = json['startTime'];
    sessionId = json['sessionId'];
    hoCode = json['hoCode'];
    soldoutStatus = json['soldoutStatus'];
    unavailabilityPercentage = json['unavailabilityPercentage'];
    advanceBookingDate = json['advanceBookingDate'];
    isBookingOpenToGuest = json['isBookingOpenToGuest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['screenName'] = screenName;
    data['screenNumber'] = screenNumber;
    data['startTime'] = startTime;
    data['sessionId'] = sessionId;
    data['hoCode'] = hoCode;
    data['soldoutStatus'] = soldoutStatus;
    data['unavailabilityPercentage'] = unavailabilityPercentage;
    data['advanceBookingDate'] = advanceBookingDate;
    data['isBookingOpenToGuest'] = isBookingOpenToGuest;
    return data;
  }
}

class MovieListFilter {
  String? id;
  String? title;
  String? urlSlug;

  MovieListFilter({id, title, urlSlug});

  MovieListFilter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    urlSlug = json['urlSlug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['urlSlug'] = urlSlug;
    return data;
  }
}
