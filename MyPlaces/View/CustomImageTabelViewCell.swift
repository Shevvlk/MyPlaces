
import UIKit

class CustomImageTabelViewCell: UITableViewCell {
    
    let imageOfPlaceView : UIImageView = {
        let photoImageView = UIImageView()
        let imagePhoto = UIImage(named: "photo")
        photoImageView.image = imagePhoto
        photoImageView.contentMode = .center
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        return photoImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(imageOfPlaceView)
        self.backgroundColor = .systemGray
        constraints ()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints () {
        imageOfPlaceView.leftAnchor.constraint(equalTo:self.contentView.leftAnchor).isActive = true
        imageOfPlaceView.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        imageOfPlaceView.rightAnchor.constraint(equalTo:self.contentView.rightAnchor).isActive = true
        imageOfPlaceView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
    }
}
