
import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var location: String?
    var name = ""
    
    private let mapView: MKMapView = {
        let map =  MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let imageClose = UIImage(systemName: "xmark")?.withTintColor(.black, renderingMode: .alwaysOriginal)
    
    private let buttonCloseMap: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonCloseMap.setImage(imageClose, for: .normal)
        view.addSubview(mapView)
        view.addSubview(buttonCloseMap)
        
        constraints ()
        setupMark ()
        
        buttonCloseMap.addTarget(self, action: #selector(handleClous), for: .touchUpInside)
    }
    
    private func setupMark () {
        
        let geocoder = CLGeocoder()
        
        guard let location = location else { return }
        
        geocoder.geocodeAddressString(location) { [weak self] (placemaks, error) in
            if let error = error {
                print(error)
                return
            }
            guard let placemaks = placemaks else {return}
            
            let placemak = placemaks.first
            
            let annotation = MKPointAnnotation()
            
            annotation.title = self?.name
            
            guard let placemarkLocation = placemak?.location else {return}
            
            annotation.coordinate = placemarkLocation.coordinate
            
            self?.mapView.showAnnotations([annotation], animated: true)
            
            self?.mapView.selectAnnotation(annotation, animated: true )
        }
    }
    
    @objc func handleClous(){
           self.dismiss(animated: true)
       }

    private func constraints () {
        buttonCloseMap.topAnchor.constraint(equalTo:self.view.topAnchor,constant: 30).isActive = true
        buttonCloseMap.rightAnchor.constraint(equalTo:self.view.rightAnchor,constant: -30).isActive = true
        
        mapView.leftAnchor.constraint(equalTo:self.view.leftAnchor).isActive = true
        mapView.topAnchor.constraint(equalTo:self.view.topAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo:self.view.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo:self.view.bottomAnchor).isActive = true
    }
    
   
}
