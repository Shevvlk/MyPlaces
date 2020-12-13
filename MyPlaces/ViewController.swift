//
//  ViewController.swift
//  MyPlaces
//
//  Created by Alexandr on 04.09.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit
import RealmSwift


protocol ArraytTransferDelegate {
    func saveArray()
}

class ViewController: UITableViewController {
    
    var places: Results<Place>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(LocationdataTableViewCell.self, forCellReuseIdentifier: "contactCell")

        places = realm.objects(Place.self)

        setUpNavigation()
    }
    
    //MARK: - Количество ячеек
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.isEmpty ? 0 : places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! LocationdataTableViewCell
        let place = places[indexPath.row]
        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
//        cell.photoImage.image = UIImage(data: place.imageData!)
        
        return cell
    }
    
    //MARK: - Переход в SecondViewController при нажатии +
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places[indexPath.row]
        let newPlaceVC = SecondViewController()
        newPlaceVC.currentPlace = place
        newPlaceVC.delegete = self
        self.navigationController?.pushViewController(newPlaceVC, animated: true)
    }
    
    //   MARK: - Настройка контроллера навигации
    func setUpNavigation ()  {
        // Настройка заголовка
        self.title = "Favourite places"
        let label: UILabel = {
            let lab = UILabel()
            lab.text = self.navigationItem.title
            lab.textColor = UIColor.black
            lab.font = UIFont(name: "Party LET", size: 35)
            lab.textAlignment = .center
            return lab
        }()
        self.navigationItem.titleView = label
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3568627451, green: 0.8431372549, blue: 0.7058823529, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(secondView))
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    
    }
    

    @objc func secondView () {
        let secondController = AddingNewPlaceViewController()
//        secondController.delegete = self
        self.present(UINavigationController(rootViewController: secondController), animated: true, completion: nil)
    }
    
   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let place = places[indexPath.row]
            StorageManager.delete(place)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension ViewController : ArraytTransferDelegate {
    func saveArray() {

        tableView.reloadData()
    }
}


