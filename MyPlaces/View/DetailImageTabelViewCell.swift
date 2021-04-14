
import UIKit

protocol NewPlaceImageTabelViewCellDelegate: AnyObject {
    func callMapController()
}

final class NewPlaceImageTabelViewCell: UITableViewCell {
    
    weak var delegate : NewPlaceImageTabelViewCellDelegate?
    
    let placeImageView : UIImageView = {
        let photoImageView = UIImageView()
        let imagePhoto = UIImage(named: "addingPhoto")
        photoImageView.image = imagePhoto
        photoImageView.contentMode = .center
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        return photoImageView
    }()
    
    let buttonMap: UIButton = {
        let button = UIButton()
        let imageMap = UIImage(named: "iconMap")
        button.setImage(imageMap, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placeImageView)
        contentView.addSubview(buttonMap)
        backgroundColor = #colorLiteral(red: 0.9113927484, green: 0.8890479803, blue: 0.8892830014, alpha: 1)
        setupConstraints ()
        
        self.buttonMap.addTarget(self, action: #selector(callMapController), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func callMapController() {
        if let delegate = delegate {
            delegate.callMapController()
        }
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            buttonMap.heightAnchor.constraint(equalToConstant: 57),
            buttonMap.widthAnchor.constraint(equalToConstant: 57),
            buttonMap.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant: -7),
            buttonMap.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -7),
            
            placeImageView.leftAnchor.constraint(equalTo:self.contentView.leftAnchor),
            placeImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor),
            placeImageView.rightAnchor.constraint(equalTo:self.contentView.rightAnchor),
            placeImageView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor)
        ])
    }
    
}
