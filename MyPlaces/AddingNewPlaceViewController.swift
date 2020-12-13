
import UIKit

class AddingNewPlaceViewController: UITableViewController, UITextFieldDelegate {
    
    var photoImage : UIImage = {
        let imagePhoto = UIImage(named: "photo")
        return imagePhoto!
    }()
     
    var placeImage :   UIImageView?
    
    let photoImageCell: UITableViewCell = {
        let photoImage = UITableViewCell()
        photoImage.backgroundColor = .gray
        return photoImage
    }()
    let placeNameCell: StaticTabel = {
       let placeName = StaticTabel()
       placeName.labelDescription.text = "Name"
        placeName.textField.placeholder = "Place name"
       return placeName
    }()
    
    let placeLocationCell: StaticTabel = {
        let placeLocation = StaticTabel()
        placeLocation.labelDescription.text = "Location"
        placeLocation.textField.placeholder = "Place location"
        return placeLocation
     }()
   
    let placeTypeCell: StaticTabel = {
    let placeType = StaticTabel()
    placeType.labelDescription.text = "Type"
    placeType.textField.placeholder = "Place type"
    return placeType
 }()

    var imageIsChanged = false
    
    
    let labelTitle: UILabel = {
        let label = UILabel()
        label.text = "New places"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Party LET", size: 35)
        label.textAlignment = .center
        return label
    }()
    
    override func loadView() {
        super.loadView()
        

    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset.right = 15
        tableView.showsVerticalScrollIndicator = false


        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object:  placeNameCell.textField,
                                               queue: OperationQueue.main)
        { _ in
            let textCount =  self.placeNameCell.textField.text?.trimmingCharacters(in: .whitespacesAndNewlines).count ?? 0
            let textIsNotEmpty = textCount > 0
            self.navigationItem.rightBarButtonItem?.isEnabled = textIsNotEmpty
        }
        
        photoImageCell.imageView?.image = photoImage
        photoImageCell.imageView?.contentMode = .scaleToFill
        setUpNavigation()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        switch indexPath.row{
        case 0:
            return photoImageCell
        case 1:
            return placeNameCell
        case 2:
            return placeLocationCell
        case 3:
            return placeTypeCell
        default:
            fatalError("Unknown number of sections")
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
        self.navigationItem.titleView = labelTitle
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(firstController))
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
            image = #imageLiteral(resourceName: "photo")
        }
        let newPlace = Place()
        newPlace.name = placeNameCell.textField.text!
        newPlace.location = placeLocationCell.textField.text
        newPlace.type = placeTypeCell.textField.text
        newPlace.imageData = image?.pngData()
        StorageManager.save(newPlace)
 }
}


