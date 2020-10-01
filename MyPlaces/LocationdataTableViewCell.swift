//
//  LocationdataTableViewCell.swift
//  MyPlaces
//
//  Created by Alexandr on 04.09.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

// MARK: - Кастомная версия ячейки 

class LocationdataTableViewCell: UITableViewCell {
    
    // MARK: - Изображение
    var photoImage : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false 
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    // MARK: - Локация
    let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Название места
    let  nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Тип места
    let typeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Контейнер
    let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(photoImage)
        containerView.addSubview(locationLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(typeLabel)
        self.contentView.addSubview(containerView)
        constraints ()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Констрейты
    func constraints () {
        photoImage.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        photoImage.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        photoImage.widthAnchor.constraint(equalToConstant:70).isActive = true
        photoImage.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.photoImage.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:60).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        locationLabel.bottomAnchor.constraint(equalTo:self.typeLabel.topAnchor ).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        typeLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
}
