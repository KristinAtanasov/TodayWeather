

import UIKit

class DetailWeatherViewController: UIViewController {
    
    var currentCityName = ""
    
    private let mainView: UIView = {
        let mainView: UIView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bluegradient")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    
    lazy var chosenCityName: UILabel = {
        let chosenCityName = UILabel()
        chosenCityName.text = self.currentCityName
        chosenCityName.font = .systemFont(ofSize: 35, weight: .semibold)
        chosenCityName.textColor = .white
        chosenCityName.translatesAutoresizingMaskIntoConstraints = false
        return chosenCityName
    }()
    
    lazy var gradusLabel: UILabel = {
        let gradusLabel = UILabel()
        gradusLabel.text = ""
        gradusLabel.font = .systemFont(ofSize: 100, weight: .semibold)
        gradusLabel.textColor = .white
        gradusLabel.translatesAutoresizingMaskIntoConstraints = false
        return gradusLabel
    }()
    
    lazy var iconImage: UIImageView = {
         let iconImage = UIImageView()
         iconImage.image = UIImage(named: "partly-cloudy-day")
         iconImage.contentMode = .scaleAspectFit
         iconImage.translatesAutoresizingMaskIntoConstraints = false
         return iconImage
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .white
        configureViewLayout()
    }
    
  
    private func configureViewLayout(){
    
    view.addSubview(mainView)
    NSLayoutConstraint.activate([
        mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        mainView.topAnchor.constraint(equalTo: view.topAnchor),
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor),
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    
    mainView.addSubview(imageView)
    NSLayoutConstraint.activate([
        imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
        imageView.topAnchor.constraint(equalTo: mainView.topAnchor),
        imageView.rightAnchor.constraint(equalTo: mainView.rightAnchor),
        imageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
    ])
    
    mainView.addSubview(chosenCityName)
    NSLayoutConstraint.activate([
        chosenCityName.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        chosenCityName.topAnchor.constraint(equalTo: mainView.safeAreaLayoutGuide.topAnchor, constant: 15),
    ])
    
    mainView.addSubview(gradusLabel)
    NSLayoutConstraint.activate([
        gradusLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        gradusLabel.topAnchor.constraint(equalTo: chosenCityName.bottomAnchor, constant: 15),
    ])
    
    mainView.addSubview(iconImage)
    NSLayoutConstraint.activate([
        iconImage.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
        iconImage.topAnchor.constraint(equalTo: gradusLabel.bottomAnchor, constant: 17),
        iconImage.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.7)
    ])
    }
}
