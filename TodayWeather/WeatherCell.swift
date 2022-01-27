

import UIKit

class WeatherCell: UITableViewCell {
    
    lazy var containerView: UIView = {
        let container = UIView()
        container.layer.cornerRadius = 23
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    lazy var backgroundContainer: UIImageView = {
        let backgroundContainer = UIImageView()
        backgroundContainer.layer.cornerRadius = 23
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
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 23, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.font = .systemFont(ofSize: 19, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()
    
    lazy var titlesContainer: UIStackView = {
        let titlesContainer = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
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
        
        containerView.addSubview(cellImageView)
        NSLayoutConstraint.activate([
            cellImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            cellImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            cellImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 1/5),
            cellImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 1/2)
        ])
        
        containerView.addSubview(titlesContainer)
        NSLayoutConstraint.activate([
            titlesContainer.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 10),
            titlesContainer.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            titlesContainer.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5)
        ])
    }
}


