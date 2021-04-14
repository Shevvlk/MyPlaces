
import UIKit

extension DetailViewController: NewPlaceImageTabelViewCellDelegate {
    
    func callMapController() {
        let mapViewController = MapViewController()
        mapViewController.name = placeNameCell.descriptionTF.text ?? ""
        mapViewController.location = placeLocationCell.descriptionTF.text ?? ""
        self.present(mapViewController, animated: true)
    }
    
}
