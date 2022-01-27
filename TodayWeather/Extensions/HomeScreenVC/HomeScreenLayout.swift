

import UIKit

extension HomeScreenVC{
    
        func settingViewConstraints(){
        view.addSubview(headerImageView)
        NSLayoutConstraint.activate([
            headerImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1/2)
        ])
        
        view.addSubview(checkWeatherButton)
        NSLayoutConstraint.activate([
            checkWeatherButton.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 100),
            checkWeatherButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/2),
            checkWeatherButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkWeatherButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
