import UIKit

struct WeatherModel: Codable{
    var days: [WeeklyWeather]
}


struct WeeklyWeather: Codable, Equatable {
    var datetime: String
    var temp: Double
    var conditions: String
    var description: String
    var icon: String
    
    var dayOfTheWeek: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let dateFromString = dateFormatter.date(from: datetime) else {fatalError("error")}
        dateFormatter.dateFormat = "EEE"
        let formattedDate = dateFormatter.string(from: dateFromString)
        
        return formattedDate
    }
}
