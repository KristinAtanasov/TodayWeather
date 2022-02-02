

import UIKit
import MapKit
import CoreLocation

class HomeScreenVC: UIViewController {
    
    var headerImageView: UIImageView = {
        let headerImageView = UIImageView()
        headerImageView.image = UIImage(named: "homescreen-1")
        headerImageView.contentMode  = .scaleAspectFit
        headerImageView.translatesAutoresizingMaskIntoConstraints = false
        return headerImageView
    }()
    
    var checkWeatherButton: UIButton = {
        let checkWeatherButton = UIButton()
        checkWeatherButton.backgroundColor = UIColor(displayP3Red: 59/255, green: 153/255, blue: 249/255, alpha: 1)
        checkWeatherButton.setTitle("Check Weather", for: .normal)
        checkWeatherButton.setTitleColor(.white, for: .normal)
        checkWeatherButton.layer.cornerRadius = 19
        checkWeatherButton.titleLabel?.font = .systemFont(ofSize: 21, weight: .bold)
        checkWeatherButton.translatesAutoresizingMaskIntoConstraints = false
        checkWeatherButton.addTarget(self, action: #selector(weatherButtonTapped), for: .touchUpInside)
        return checkWeatherButton
    }()
    var weeklyTemperature = [WeeklyWeather]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.backBarButtonItem?.tintColor = .blue
        settingViewConstraints()
        
        LocationManager.shared.getUserLocation { [weak self] location in
            DispatchQueue.main.async {
                guard let strongSelf = self else {return}
                strongSelf.addCityName(location: location)
            }
        }
    }

    
    func addCityName(location: CLLocation){
        LocationManager.shared.resolveLocationName(with: location) {[weak self] locationName in
            guard let location = locationName else {return}
            self?.title = location
        }
    }
    
    @objc func weatherButtonTapped(){
        let weatherCitiesListVC = CitiesWeathersListVC()
        weatherCitiesListVC.cityLocation = self.title!
        navigationController?.pushViewController(weatherCitiesListVC, animated: true)
        navigationController?.modalPresentationStyle = .fullScreen
    }
}
