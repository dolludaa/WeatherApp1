# :sparkles:Weather Project SwiftUI

This app is very simple project, which designed to understand SwiftUI. It includes Main screen and Welcome screen.

<img align="right" width="25%" src="https://user-images.githubusercontent.com/111228178/192374728-7e917d15-5a3c-4757-a791-cdc950da4cbe.PNG ">


  
 ## *What I've learned* 
  So, the main goal of this project was to learn more about SwiftUI, as well as get to know the API and Jason better.

1. To build the UI part, I used swiftUI to make 2 screens, a screen for accessing the location and a weather display screen

2. Before requesting the weather in the beginning, I needed to get access to the user's location. For this I used CoreLocation. The data in my app is only calculated for the weather at the moment (thanks to the Open Weather API), but there are no forecasts in the app.

 3. Having received permission to access geodata from the user, I was already able to make requests to the Open Weather API using the RESTFUL API with the help of the URLSession.
   
 4. The server's response comes in json format and in order to work with this data in the application, I needed to decode the received objects. To do this, I used Json Decoder and Decodable protocol.

``` swift
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
```

5. Further, the received objects are already transferred to the UI layer where this data is outlined. To work with asynchronous data, I decided to use async await because it is more logically combined with SwiftUI than the Result approach.

:sunny: :umbrella: :cloud: :snowflake: :zap:


<p align="center" width="100%">
    <img width="30%" src="https://user-images.githubusercontent.com/111228178/192370397-d07cdcbd-e743-41bd-9cef-cbca5ca494f7.PNG">
    <img width="30%" src="https://user-images.githubusercontent.com/111228178/192377179-e3f17129-138a-4828-a985-599991bce52b.PNG">
    
</p>

:point_up_2:   Welcome screen. It is on it that the user's geolocation is requested in order to provide the weather exactly in the territory where he is currently located

## Installation

1. Clone or download the project to your local machine
2. Open the project in Xcode
3. Replace ```YOURAPIKEY``` with your valid Open Weather API key in ```WeatherManager```

``` swift
class WeatherManager {
    func getCurrentWeather(
        latitude: CLLocationDegrees, 
        longitude: CLLocationDegrees) async throws -> ResponseBody {

        guard let url = URL(
            string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(YOURAPIKEY)&units=metric") 
            else {fatalError("Missing URL ")}
```
4. Run the simulator



## Keyword

* SwiftUI
*  Stacks
*  Images and Text
*  JSON & Codable

## Prerequisites

* A valid API key from Openweathermap
* A Mac running macOS Catalina
* Xcode 14 
