//
//  SecondViewController.swift
//  MyPlaces
//
//  Created by Alexandr on 13.09.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UINavigationControllerDelegate {
    
    var delegete : ArraytTransferDelegate?
    
    var photoImage : UIButton = {
        let img = UIImage()
        let button = UIButton()
        button.setImage(UIImage (named: "photo"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var locationTxtField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Location"
        txtField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    var nameTxtField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Name"
        txtField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    var typeTxtField: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Type"
        txtField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        txtField.borderStyle = .roundedRect
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Place location"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let  nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.layer.cornerRadius = 5
        label.text = "Place name"
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.text = "Place type"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(locationTxtField)
        self.view.addSubview(photoImage)
        self.view.addSubview(nameTxtField)
        self.view.addSubview(typeTxtField)
        self.view.addSubview(locationLabel)
        self.view.addSubview(nameLabel)
        self.view.addSubview(typeLabel)
        
        photoImage.addTarget(self, action: #selector(touche), for: .touchUpInside)
        // Настройка констрейнтов
        constraints ()
        // Настройка Navigation Bar
        setUpNavigation()
        // Регистрация наблюдателей
        registerForKeyboardNotifications()
        
        nameTxtField.addTarget(self, action: #selector(textfieldChanged), for: .editingChanged)
    }
    // MARK: - Удаление NotificationCenter
    deinit {
        removeForKeyboardNotifications ()
    }
    
    @objc func firstController()  {
        saveNewPlace()
        delegete?.saveArray()
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @objc func handleCansel() {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Меню при нажатии на картинку (фото)
    @objc func touche() {
        let actionSheet = UIAlertController(title: nil ,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera )
        }
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        present(actionSheet, animated: true)
    }
    
    @objc func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Регистрация уведомлений
    func removeForKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //     MARK: - Сдвиг view наверх
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, self.view.frame.origin.y == 0  {
            if (self.typeTxtField.frame.origin.y + self.typeTxtField.frame.height) >= (self.view.frame.height -  keyboardSize.height) {
                self.view.frame.origin.y -= (self.typeTxtField.frame.origin.y + self.typeTxtField.frame.height) - (self.view.frame.height - keyboardSize.height) + 5
            }
        }
    }
    
    // MARK: - Закрытие клавиатуры при касании в любом месте
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(false)
    }
    
    // MARK: - Закрытие клавиатуры (сдвиг вниз)
    @objc func keyboardWillHide() {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    // MARK: - Констрейты
    func constraints () {
        
        photoImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        photoImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        photoImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        photoImage.bottomAnchor.constraint(equalTo: self.view.topAnchor, constant: 350).isActive = true
        
        nameTxtField.topAnchor.constraint(equalTo: self.photoImage.bottomAnchor, constant: 50).isActive = true
        nameTxtField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        nameTxtField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        nameTxtField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        nameLabel.bottomAnchor.constraint(equalTo: self.nameTxtField.topAnchor, constant: -5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.nameTxtField.leadingAnchor).isActive = true
        
        locationTxtField.topAnchor.constraint(equalTo: self.nameTxtField.bottomAnchor, constant: 50).isActive = true
        locationTxtField.leadingAnchor.constraint(equalTo: self.nameTxtField.leadingAnchor).isActive = true
        locationTxtField.trailingAnchor.constraint(equalTo: self.nameTxtField.trailingAnchor).isActive = true
        locationTxtField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        locationLabel.bottomAnchor.constraint(equalTo: self.locationTxtField.topAnchor, constant: -5).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo: self.locationTxtField.leadingAnchor).isActive = true
        
        typeTxtField.topAnchor.constraint(equalTo: self.locationTxtField.bottomAnchor, constant: 50).isActive = true
        typeTxtField.leadingAnchor.constraint(equalTo: self.locationTxtField.leadingAnchor).isActive = true
        typeTxtField.trailingAnchor.constraint(equalTo: self.locationTxtField.trailingAnchor).isActive = true
        typeTxtField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        typeLabel.bottomAnchor.constraint(equalTo: self.typeTxtField.topAnchor, constant: -5).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo: self.typeTxtField.leadingAnchor).isActive = true
    }
    
    func saveNewPlace() {
        
        let newPlace = Place()
        newPlace.name = nameTxtField.text!
        newPlace.location = locationTxtField.text
        newPlace.type = typeTxtField.text
        newPlace.imageData = photoImage.currentImage?.pngData()
        StorageManager.save(newPlace)
    }
    
    // Настройка Navigation Bar
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
    
}

extension FirstViewController: UITextFieldDelegate {
    @objc private func textfieldChanged () {
        print("textfieldChanged")
        if nameTxtField.text?.isEmpty == false {
            navigationItem.rightBarButtonItem?.isEnabled = true
        } else {
            navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
}

extension FirstViewController: UIImagePickerControllerDelegate {
    
    func chooseImagePicker (source: UIImagePickerController.SourceType ) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            
            
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            
            DispatchQueue.global(qos: .background).async {
              imagePicker.sourceType = source
                DispatchQueue.main.async {
                    self.present(imagePicker,animated: true)
                }
            }
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImage.setImage(info[.editedImage] as? UIImage, for: .normal)
        photoImage.contentMode = .scaleAspectFill
        photoImage.clipsToBounds = true
        dismiss(animated: true)
    }
}



