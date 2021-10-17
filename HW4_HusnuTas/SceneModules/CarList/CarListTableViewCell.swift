//
//  CarListTableViewCell.swift
//  HW4_HusnuTas
//
//  Created by Hüsnü Taş on 16.10.2021.
//

import UIKit

class CarListTableViewCell: BaseTableViewCell {
    
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.clipsToBounds = true
        temp.backgroundColor = .white
        temp.layer.cornerRadius = 10
        temp.layer.shadowOffset = CGSize(width: 0, height: 6)
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOpacity = 0.4
        temp.layer.borderColor = UIColor.black.cgColor
        temp.layer.masksToBounds = false
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [carTitleLabel, bodyStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var bodyStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [carImageView, infoStackView])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 10
        return temp
    }()
    
    private lazy var infoStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [carInfoLeftLabel, carInfoRightLabel])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 2
        return temp
    }()
    
    private lazy var carImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 10
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 4)
        temp.layer.shadowOpacity = 0.4
        temp.clipsToBounds = true
        return temp
    }()

    private lazy var carTitleLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.numberOfLines = 0
        temp.adjustsFontSizeToFitWidth = true
        temp.textColor = .black
        temp.textAlignment = .center
        temp.font = FontManager.bold(20).value
        return temp
    }()
    
    private lazy var carInfoLeftLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.numberOfLines = 5
        temp.textColor = .black
        temp.lineBreakMode = .byTruncatingTail
        temp.textAlignment = .left
        temp.font = FontManager.bold(17).value
        return temp
    }()
    
    private lazy var carInfoRightLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.numberOfLines = 5
        temp.textColor = .black
        temp.lineBreakMode = .byTruncatingTail
        temp.textAlignment = .right
        temp.font = FontManager.regular(17).value
        return temp
    }()

    override func addMajorViews() {
        super.addMajorViews()
        contentView.addSubview(containerView)
        containerView.addSubview(mainStackView)
    }
    
    override func setupView() {
        super.setupView()
        
        containerView.expandView(to: contentView, with: 10)
        mainStackView.expandView(to: containerView, with: 10)
        
        NSLayoutConstraint.activate([
            carTitleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 20),
            
            bodyStackView.topAnchor.constraint(equalTo: carTitleLabel.bottomAnchor, constant: 20),
            bodyStackView.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor),
            bodyStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor),
            bodyStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor),
            
            carImageView.heightAnchor.constraint(equalToConstant: 110),
            carImageView.widthAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1/2, constant: -20)
        ])
    }
    
    func setData(car: Car) {
        carImageView.load(url: URL(string: car.photo.thumbnail)!)
        carTitleLabel.text = car.title
        carInfoLeftLabel.text = "Brand \nModel \nColor \nYear \nEngine"
        carInfoRightLabel.text = "\(car.brand)\n\(car.model)\n\(car.color)\n\(car.year)\n\(car.engine)"
    }
    
}

extension UIImageView {
    /// Loads image from the given url and creates a UIImage
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
