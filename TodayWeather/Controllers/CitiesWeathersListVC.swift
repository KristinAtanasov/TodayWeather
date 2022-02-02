import UIKit

class CitiesWeathersListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cellIdentifier = "newsCell"

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var activityIndicator:UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = .black
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    var cityLocation = ""
    var weeklyTemperature = [WeeklyWeather]()
    var tempToString = ""
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Weather App"
        convigureViewsLayout()
        configureTableView()
        
        NetworkController.shared.fetchWeather(cityName: cityLocation) { (result) in
            switch result{
            case .success(let weeklyWeather):
                DispatchQueue.main.async {
                    self.updateUI(weeklyTemperature: weeklyWeather)
                }
            case .failure(let error):
                self.displayError(error: error, title: "Please check you network connection.")
            }
        }
    }
    
    func updateUI(weeklyTemperature: [WeeklyWeather]){
        DispatchQueue.main.async {
            self.weeklyTemperature = weeklyTemperature
            self.tableView.reloadData()
        }
    }
    
    func displayError(error: Error, title: String){
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    private func configureTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellIdentifier)
    }

}

