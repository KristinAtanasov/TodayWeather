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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Weather App"
        
        convigureViewsLayout()
        configureTableView()
        self.activityIndicator.startAnimating()
        NetworkController.shared.fetchWeather(cityName: cityLocation) { (result) in
            switch result{
            case .success(let weeklyWeather):
                self.updateUI(weeklyTemperature: weeklyWeather)
            case .failure(let error):
                self.displayError(error: error, title: "Please check you network connection.")
            }
        }
        self.activityIndicator.stopAnimating()
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
}



extension CitiesWeathersListVC{
    //MARK: - TableView Datasourse and Delegate methods
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
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
        
        let weatherModel = weeklyTemperature[indexPath.row]
        
        configureCellColors(cell: cell)
       // cell.containerView.backgroundColor = UIColor(displayP3Red: 73/255, green: 128/255, blue: 156/255, alpha: 1.0)
        cell.cellImageView.image = UIImage(named: weatherModel.icon )
        cell.titleLabel.text = weatherModel.conditions
        cell.descriptionLabel.text = weatherModel.description
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let cellData = WeatherModel.mockData[indexPath.row]
        //   print(cellData)
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
        //cell.layer.backgroundColor = CGColor(red: 255/255, green: 255/255, blue: 246/255, alpha: 1)
        cell.selectionStyle = .none
        return cell
    }
}

