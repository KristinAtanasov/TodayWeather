

import UIKit

class DetailWeatherViewController: UIViewController {

    private let mainView: UIView = {
        let mainView: UIView = UIView()
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherImageView: UIImageView = {
        let weatherImageView = UIImageView()
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        return weatherImageView
    }()
    
    private let gradusLabel: UILabel = {
        let gradusLabel = UILabel()
        gradusLabel.translatesAutoresizingMaskIntoConstraints = false
        return gradusLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    configure
    
}
