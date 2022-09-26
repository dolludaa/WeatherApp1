# :sparkles:Weather Project SwiftUI

This app is very simple project, which designed to understand SwiftUI. It includes Main screen and Welcome screen.

<img align="right" width="25%" src="https://user-images.githubusercontent.com/111228178/192374728-7e917d15-5a3c-4757-a791-cdc950da4cbe.PNG ">

## Keyword

1. SwiftUI
2. Stacks
3. Images and Text
4. JSON & Codable

## Prerequisites

* A valid API key from Openweathermap
* A Mac running macOS Catalina
* Xcode 14 
  
 ## *What I've learned* 
  So, the main goal of this project was to learn more about using SwiftUI, as well as get to know the API and Jason better.

It turned out to be the easiest to draw a UI, but the most important problem was displaying the weather based on location. The data in my app is only calculated for the weather at the moment (thanks to the Open Weather API), but there are no forecasts in the app.

A structure was created with all the requested elements. To make this structure encoded and decoded, we will conform to the Codable protocol. After that I created decodable nested objects
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
To begin with, we worked with two main indicators - longitude and latitude, in order not to enter this data every time, a welcome screen was created on which there is a share geolocation button, after which using CoreLocationUI and CoreLocation.
``` swift
LocationButton(.sendCurrentLocation) {
                locationManager.requestLocation()
            }
```
To decode the received data, we call the API and use JSONDecoder. Initially, the URL cannot be used just like that, in order to solve this problem I needed to convert it to a URL type before you can make a call. To do this, you can use a simple guard operator. Also to check that the data is coming in without errors.
```swift
if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
```
After that, the User Interface was drawn in more detail.
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

<img src="https://i.gifer.com/2GU.gif" width="200" height="200" />
