
import UIKit

extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            
            self.present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        photoImageCell.placeImageView.image = (info[.editedImage] as? UIImage)!
        photoImageCell.placeImageView.contentMode = .scaleAspectFill
        photoImageCell.placeImageView.clipsToBounds = true
        imageIsChanged = true
        
        dismiss(animated: true)
    }
}
