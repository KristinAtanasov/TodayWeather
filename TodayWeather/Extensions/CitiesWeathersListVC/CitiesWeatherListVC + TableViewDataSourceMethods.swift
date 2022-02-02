

import UIKit

extension CitiesWeathersListVC{
    
    //MARK: - TableView Datasourse and Delegate methods
    
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
        let cellData = weeklyTemperature[indexPath.row]
        
        let detailVC = DetailWeatherViewController()
        detailVC.currentCityName = self.cityLocation
        detailVC.gradusLabel.text = String("\(cellData.temp)°")
        detailVC.iconImage.image = UIImage(named: cellData.icon)
        
        navigationController?.pushViewController(detailVC, animated: true)
        navigationController?.modalPresentationStyle = .fullScreen
        
        UIView.animate(withDuration: 0.5, animations: { cell?.alpha = 0.5}) { (completed) in
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
