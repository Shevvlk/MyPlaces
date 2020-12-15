
import UIKit

extension NewPlaceViewController {
    
    func callAlert () {
        let actionSheet = UIAlertController(title: nil,
                                            message: nil,
                                            preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        let photo = UIAlertAction(title: "Photo library", style: .default) { _ in
            self.chooseImagePicker(source: .photoLibrary)
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        actionSheet.addAction(camera)
        actionSheet.addAction(photo)
        actionSheet.addAction(cancel)
        
        self.present(actionSheet, animated: true)
    }
}
