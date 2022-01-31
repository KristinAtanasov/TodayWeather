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
    var spinerView = UIActivityIndicatorView(style: .large)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Weather App"
        convigureViewsLayout()
        
        
        
//        NetworkController.shared.fetchWeather(cityName: cityLocation) { (result) in
//            switch result{
//            case .success(let weeklyWeather):
//                DispatchQueue.main.async {
//                    self.updateUI(weeklyTemperature: weeklyWeather)
//                }
//            case .failure(let error):
//                self.displayError(error: error, title: "Please check you network connection.")
//            }
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        configureTableView()
        
        var activityIndicatorView = UIActivityIndicatorView()
        tableView.backgroundView = activityIndicatorView
        activityIndicatorView.startAnimating()
        
            OperationQueue.main.addOperation() {
                activityIndicatorView.stopAnimating()
                NetworkController.shared.fetchWeather(cityName: self.cityLocation) { (result) in
                    switch result{
                    case .success(let weeklyWeather):
                        DispatchQueue.main.async {
                            self.updateUI(weeklyTemperature: weeklyWeather)
                        }
                    case .failure(let error):
                        self.displayError(error: error, title: "Please check you network connection.")
                    }
                }
                       

                self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.singleLine
                       self.tableView.reloadData()
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
    
//    func showSpinner(){
//        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
//
//        spinerView.translatesAutoresizingMaskIntoConstraints = false
//        spinerView.startAnimating()
//        view.addSubview(spinerView)
//
//        spinerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        spinerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
//    func removeSpinner(){
//        spinerView.removeFromSuperview()
//    }
}

extension CitiesWeathersListVC{
    //MARK: - TableView Datasourse and Delegate methods
    private func configureTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.register(WeatherCell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weeklyTemperature.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! WeatherCell
        
        var weatherModel = weeklyTemperature[indexPath.row]
        
        configureCellColors(cell: cell)
        
        cell.gradusLabel.text = String("\(weatherModel.temp) °")
        cell.weekDayLabel.text = weatherModel.dayOfTheWeek
        cell.cellImageView.image = UIImage(named: weatherModel.icon)
        cell.titleLabel.text = weatherModel.conditions
        cell.cityNameLabel.text = cityLocation
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        UIView.animate(withDuration: 0.5,
                       animations: {
                        //Fade-out
                        cell?.alpha = 0.5
                       }) { (completed) in
            UIView.animate(withDuration: 0.5,
                           animations: {
                            //Fade-out
                            cell?.alpha = 1
                           })
        }
    }
    func configureCellColors(cell: UITableViewCell) -> UITableViewCell{
        cell.layer.borderWidth = 3
        cell.layer.borderColor = CGColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
}

