
import UIKit


class LocationdataTableViewCell: UITableViewCell {
    
    let photoImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false 
        imgView.layer.cornerRadius = 35
        imgView.clipsToBounds = true
        return imgView
    }()
    
    let  nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geeza Pro", size: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geeza Pro", size: 15)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8505162119)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geeza Pro", size: 15)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8505162119)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(photoImageView)
        containerView.addSubview(locationLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(typeLabel)
        self.contentView.addSubview(containerView)
        self.backgroundColor = #colorLiteral(red: 0.9843270183, green: 0.9525683522, blue: 0.9402120709, alpha: 1)
        constraints ()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints () {
        photoImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant:70).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant:70).isActive = true
        
        containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo:self.photoImageView.trailingAnchor, constant:10).isActive = true
        containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant:60).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        locationLabel.bottomAnchor.constraint(equalTo:self.typeLabel.topAnchor ).isActive = true
        locationLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
        
        typeLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor).isActive = true
        typeLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor).isActive = true
        typeLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor).isActive = true
    }
    
}
