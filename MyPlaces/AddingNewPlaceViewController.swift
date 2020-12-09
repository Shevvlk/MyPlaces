//
//  StaticTableViewController.swift
//  MyPlaces
//
//  Created by Alexandr on 03.12.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class AddingNewPlaceViewController: UITableViewController {
    
    var photoImage : UIImage = {
        let imagePhoto = UIImage(named: "photo")
        return imagePhoto!
    }()
    
    var placeImage :   UIImageView?
    var placeName:     UITextField?
    var placeLocation: UITextField?
    var placeType:     UITextField?
    var imageIsChanged = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset.right = 15
        tableView.showsVerticalScrollIndicator = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.register(StaticTabel.self, forCellReuseIdentifier: "contactCell")
        
        // Настройка Navigation Bar
        setUpNavigation()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.backgroundColor = .systemGray
            cell.imageView?.image = photoImage
            cell.imageView?.contentMode = .scaleAspectFill
            placeImage = cell.imageView
            return cell
            
        default:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! StaticTabel
            
            switch indexPath.row {
            
            case 1:
                cell.labelDescription.text = "Name"
                cell.textField.placeholder = "Place name"
                placeName = cell.textField
                return cell
            case 2:
                cell.labelDescription.text = "Location"
                cell.textField.placeholder = "Place location"
                placeLocation = cell.textField
                return cell
            default:
                cell.labelDescription.text = "Type"
                cell.textField.placeholder = "Place type"
                placeType = cell.textField
                return cell
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let actionSheet = UIAlertController(title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet)
            
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source: .camera)
            }
            
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
        } else {
            view.endEditing(true)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 300
        default:
            return 75
        }
    }
    
    
    func setUpNavigation (){
        
        let labelTitle: UILabel = {
            let label = UILabel()
            label.text = "New places"
            label.textColor = UIColor.black
            label.font = UIFont(name: "Party LET", size: 35)
            label.textAlignment = .center
            return label
        }()
        
        self.navigationItem.titleView = labelTitle
        //  Кнопка Save
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(firstController))
        //  Кнопка Cancel
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.cancel, target: self, action: #selector(handleCansel))
        self.navigationItem.rightBarButtonItem?.tintColor = .black
        self.navigationItem.rightBarButtonItem?.isEnabled = false
        
    }
    
    @objc func firstController()  {
        saveNewPlace()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func handleCansel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func saveNewPlace() {
        var image: UIImage?
        
        if imageIsChanged {
            image = placeImage?.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
        let newPlace = Place()
        newPlace.name = (placeName?.text)!
        newPlace.location = placeLocation?.text
        newPlace.type = placeType?.text
        newPlace.imageData = image?.pngData()
        StorageManager.save(newPlace)
    }
    
}


