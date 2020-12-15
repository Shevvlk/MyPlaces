
import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    private var places: Results<Place>?
    private var token:  NotificationToken? = nil
    private var realm:  Realm?
    private let storageManager = StorageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9843270183, green: 0.9525683522, blue: 0.9402120709, alpha: 1)
        
        tableView.tableFooterView = UIView()
        tableView.register(LocationdataTableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        do {
            realm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
        
        places = realm?.objects(Place.self)
        
        setUpNavigation()
        token = realm?.observe { [weak self] notification, realm in
            self?.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! LocationdataTableViewCell
        let place = places?[indexPath.row]
        cell.nameLabel.text = place?.name
        cell.locationLabel.text = place?.location
        cell.typeLabel.text = place?.type
        cell.photoImageView.image = UIImage(data: (place?.imageData)!)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let place = places?[indexPath.row]
        let newPlaceVC = NewPlaceViewController()
        newPlaceVC.currentPlace = place
        self.navigationController?.pushViewController(newPlaceVC, animated: true)
    }
    
    
    func setUpNavigation ()  {
        let label: UILabel = {
            let lab = UILabel()
            lab.text = "Favourite places"
            lab.textColor = UIColor.black
            lab.font = UIFont(name: "Snell Roundhand", size: 32)
            lab.textAlignment = .center
            return lab
        }()
        self.navigationItem.titleView = label
        self.navigationController!.navigationBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.9137254902, green: 0.8, blue: 0.7764705882, alpha: 1)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(secondView))
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    
    @objc func secondView () {
        let secondController = NewPlaceViewController()
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
            guard let place = places?[indexPath.row] else { return }
            guard  let token = self.token else {return}
            storageManager.delete(place, [token])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}



