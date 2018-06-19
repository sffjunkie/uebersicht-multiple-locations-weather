{
  providers: [
    {
      id: "darksky"
      exclude: ""
      endpoint: (lat, lng, key = "") ->
        "https://api.darksky.net/forecast/#{key}/#{lat},#{long}?exclude=minutely,hourly,alerts,flags"
    },
    {
      id: "yahoo"
      exclude: null
      endpoint: (lat, lng, key = "") ->
        "http://where.yahooapis.com/geocode?locale=en_US&flags=&offset=15&q=\"#{lat},#{long}\"&gflags=R"
    },
    {
      id: "owm"
      endpoint: (lat, lng, key = "") ->
        "https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lon}"
    }
  ]

  weather: (provider, lat, lng, apiKey = "") ->
    if provider in @providers
      @run("curl -sS #{@providers[provider].endpoint(lat, lng, apiKey)}")
}
