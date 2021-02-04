
import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    private var places: Results<Place>?
    private var token:  NotificationToken? = nil
    private var realm:  Realm?
    private let storageManager = StorageManager()
    private let searchController = UISearchController(searchResultsController: nil)
    private var filterPlaces = [Place]()
    
    private let titleLabel: UILabel = {
        let lab = UILabel()
        lab.text = "Favourite places"
        lab.textColor = UIColor.black
        lab.font = UIFont(name: "Snell Roundhand", size: 32)
        lab.textAlignment = .center
        return lab
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = #colorLiteral(red: 0.9843270183, green: 0.9525683522, blue: 0.9402120709, alpha: 1)
        
        tableView.separatorInset.left = 90
        tableView.tableFooterView = UIView()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: "contactCell")
        
        do {
            realm = try Realm()
        } catch {
            print(error.localizedDescription)
        }
        
        places = realm?.objects(Place.self)
        
        setUpNavigation()
        configureSearchController ()
        
        token = realm?.observe { [weak self] notification, realm in
            self?.tableView.reloadData()
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchController.isActive && searchController.searchBar.text != "" {
            return filterPlaces.count
        }
        return places?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! MainTableViewCell
        
        let place: Place?
        
        if searchController.isActive && searchController.searchBar.text != "" {
            place = filterPlaces[indexPath.row]
        } else {
            place = places?[indexPath.row]
        }
        
        cell.nameLabel.text = place?.name
        cell.locationLabel.text = place?.location
        cell.typeLabel.text = place?.type
        cell.placeImageView.image = UIImage(data: (place?.imageData)!)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let place: Place?
        
        if searchController.isActive && searchController.searchBar.text != "" {
            place = filterPlaces[indexPath.row]
        } else {
            place = places?[indexPath.row]
        }
        
        let newPlaceVC = NewPlaceViewController()
        newPlaceVC.currentPlace = place
        self.navigationController?.pushViewController(newPlaceVC, animated: true)
    }
    
    
    private func setUpNavigation ()  {
        self.navigationItem.titleView = titleLabel
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
        return 90
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let place = places?[indexPath.row] else { return }
            guard  let token = self.token else {return}
            storageManager.delete(place, [token])
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    private  func configureSearchController () {
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search by name"
        searchController.searchResultsUpdater = self
        definesPresentationContext = true
        navigationItem.searchController = searchController
        searchController.searchBar.tintColor = UIColor.black
        searchController.searchBar.barTintColor = #colorLiteral(red: 0.9137254902, green: 0.8, blue: 0.7764705882, alpha: 1)
    }
}


extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterPlaces(for: searchController.searchBar.text ?? "")
    }
    
    private func filterPlaces(for searchText: String) {
        filterPlaces = places?.filter({ (place) -> Bool in
            return place.name.lowercased().contains(searchText.lowercased())
        }) ?? []
        tableView.reloadData()
    }
}

