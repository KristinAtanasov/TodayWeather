

import UIKit

class NetworkController{
    
    static var shared = NetworkController()
    
    func fetchWeather(cityName: String, complition: @escaping( Result<[WeeklyWeather], Error>) -> Void){
        let stringURL = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/timeline/\(cityName)?unitGroup=metric&elements=datetime%2CdatetimeEpoch%2Cname%2Caddress%2CresolvedAddress%2Clatitude%2Clongitude%2Ctemp%2Cconditions%2Cdescription%2Cicon%2Cstations%2Csource&key=HCSUWWZ8RYPS8TZN2L65DV4D4&contentType=json"
        
        let safetyURL = stringURL.replacingOccurrences(of: " ", with: "-")
        guard let url = URL(string: safetyURL) else {return}
        
        let taskRequest = URLSession.shared.dataTask(with: url){ (data, response, error) in
            if let data = data{
                do {
                    let jsonDecoder = JSONDecoder()
                    let weatherData = try jsonDecoder.decode(WeatherModel.self, from: data)
                    complition(.success(weatherData.days))
                    
                } catch{
                    complition(.failure(error))
                }
            } else if let error = error{
                complition(.failure(error))
            }
        }
        taskRequest.resume()
    }
}
