

import UIKit

class WeatherCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        return containerView
    }()
    lazy var weekDayLabel: UILabel = {
        let weekDayLabel = UILabel()
        weekDayLabel.font = .systemFont(ofSize: 21, weight: .bold)
        weekDayLabel.textColor = .white
        weekDayLabel.textAlignment = .center
        weekDayLabel.translatesAutoresizingMaskIntoConstraints = false
        return weekDayLabel
    }()
    
    lazy var backgroundContainer: UIImageView = {
        let backgroundContainer = UIImageView()
        backgroundContainer.layer.cornerRadius = 19
        backgroundContainer.image = UIImage(named: "bluegradient")
        backgroundContainer.clipsToBounds = true
        backgroundContainer.translatesAutoresizingMaskIntoConstraints = false
        return backgroundContainer
    }()
    
    
    lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var gradusLabel: UILabel = {
        let gradusLabel = UILabel()
        gradusLabel.font = .systemFont(ofSize: 21, weight: .bold)
        gradusLabel.numberOfLines = 0
        gradusLabel.textColor = .white
        gradusLabel.translatesAutoresizingMaskIntoConstraints = false
        return gradusLabel
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 21, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    
    lazy var cityNameLabel: UILabel = {
        let cityNameLabel = UILabel()
        cityNameLabel.font = .systemFont(ofSize: 16, weight: .semibold)
        cityNameLabel.numberOfLines = 0
        cityNameLabel.textColor = .white
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return cityNameLabel
    }()
    
    lazy var titlesContainer: UIStackView = {
        let titlesContainer = UIStackView(arrangedSubviews: [titleLabel, cityNameLabel])
        titlesContainer.axis = .vertical
        titlesContainer.alignment = .fill
        titlesContainer.distribution = .fillEqually
        titlesContainer.translatesAutoresizingMaskIntoConstraints = false
        return titlesContainer
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    required init?(coder: NSCoder) {
        fatalError("There is an issue with the initialization")
    }
    
    
    //Configure the layouts of the views inside of the cell
    private func configureViews(){
        contentView.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        containerView.addSubview(backgroundContainer)
        NSLayoutConstraint.activate([
            backgroundContainer.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            backgroundContainer.topAnchor.constraint(equalTo: containerView.topAnchor),
            backgroundContainer.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            backgroundContainer.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        containerView.addSubview(weekDayLabel)
        NSLayoutConstraint.activate([
            weekDayLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            weekDayLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            weekDayLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            weekDayLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/7)
        ])
        
        containerView.addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: weekDayLabel.trailingAnchor),
            cellImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            cellImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/6),
            cellImageView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 1/2)
        ])
        
        contentView.addSubview(gradusLabel)
        NSLayoutConstraint.activate([
            gradusLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            gradusLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            gradusLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/6)
        ])
        
        containerView.addSubview(titlesContainer)
        NSLayoutConstraint.activate([
            titlesContainer.leadingAnchor.constraint(equalTo: gradusLabel.trailingAnchor, constant: 10),
            titlesContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titlesContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5)
        ])
    }
}


