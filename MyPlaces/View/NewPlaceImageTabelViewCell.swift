
import UIKit


protocol NewPlaceImageTabelViewCellDelegate: AnyObject {
    func customImageTabelViewCellDelegate()
}


class NewPlaceImageTabelViewCell: UITableViewCell {
    
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
        
        self.contentView.addSubview(placeImageView)
        self.contentView.addSubview(buttonMap)
        self.backgroundColor = #colorLiteral(red: 0.9113927484, green: 0.8890479803, blue: 0.8892830014, alpha: 1)
        constraints ()
        
        self.buttonMap.addTarget(self, action: #selector(subscribeButtonTapped(_:)), for: .touchUpInside)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func subscribeButtonTapped(_ sender: UIButton) {
        
        if let _ = delegate {
            self.delegate?.customImageTabelViewCellDelegate()
        }
    }
    
    private func constraints () {
        buttonMap.heightAnchor.constraint(equalToConstant: 57).isActive = true
        buttonMap.widthAnchor.constraint(equalToConstant: 57).isActive = true
        buttonMap.rightAnchor.constraint(equalTo:self.contentView.rightAnchor, constant: -7).isActive = true
        buttonMap.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor, constant: -7).isActive = true
        
        placeImageView.leftAnchor.constraint(equalTo:self.contentView.leftAnchor).isActive = true
        placeImageView.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        placeImageView.rightAnchor.constraint(equalTo:self.contentView.rightAnchor).isActive = true
        placeImageView.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
    }
}
