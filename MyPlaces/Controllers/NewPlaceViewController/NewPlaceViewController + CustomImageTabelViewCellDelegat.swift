
import UIKit

extension NewPlaceViewController: NewPlaceImageTabelViewCellDelegate {
    func customImageTabelViewCellDelegate() {
        let mapViewController = MapViewController()
        mapViewController.name = placeNameCell.textFieldDescription.text ?? ""
        mapViewController.location = placeLocationCell.textFieldDescription.text ?? ""
        self.present(mapViewController, animated: true)
    }
}
