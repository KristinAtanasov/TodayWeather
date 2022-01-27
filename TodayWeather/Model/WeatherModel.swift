import UIKit

struct WeatherModel: Codable{
    var days: [WeeklyWeather]
}

//struct Days: Codable {
//    var weeklyWeather: [WeeklyWeather]
//}

struct WeeklyWeather: Codable, Equatable {
    var datetime: String
    var temp: Double
    var conditions: String
    var description: String
    var icon: String
}
