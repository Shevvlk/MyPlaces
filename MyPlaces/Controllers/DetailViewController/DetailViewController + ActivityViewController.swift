
import UIKit

extension DetailViewController {
    
    @objc func callActivityController() {
        
        guard let image = photoImageCell.placeImageView.image?.jpegData(compressionQuality: 0.8) else { return }
        
        let description = placeNameCell.descriptionTF.text!
        let location = placeLocationCell.descriptionTF.text ?? ""
        let descAndLocation = description + "\n" + location
        
        let activityViewController = UIActivityViewController(activityItems: [image, descAndLocation], applicationActivities: [])
        activityViewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityViewController, animated: true)
    }
    
}
