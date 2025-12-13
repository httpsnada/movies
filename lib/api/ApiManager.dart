class ApiManager{
  //Singleton class
  ApiManager._();
  static ApiManager? _instance;
  static ApiManager get instance {
    _instance ??= ApiManager._();
    //we will return the instance incase it's not null
    return _instance!;
  }
  getMoviesSources(){
    //call api and get movies sources

  }
}