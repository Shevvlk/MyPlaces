
import UIKit

final class MainTableViewCell: UITableViewCell {
    
    let placeImageView: ShadowView = {
        let shadowView = ShadowView()
        shadowView.translatesAutoresizingMaskIntoConstraints = false
        return shadowView
    }()
    
    let  nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geeza Pro", size: 20)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geeza Pro", size: 15)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8505162119)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geeza Pro", size: 15)
        label.textColor =  #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8505162119)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(placeImageView)
        containerView.addSubview(locationLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(typeLabel)
        contentView.addSubview(containerView)
        backgroundColor = #colorLiteral(red: 0.9843270183, green: 0.9525683522, blue: 0.9402120709, alpha: 1)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            placeImageView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            placeImageView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:10),
            placeImageView.widthAnchor.constraint(equalToConstant:70),
            placeImageView.heightAnchor.constraint(equalToConstant:70),
            
            containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.placeImageView.trailingAnchor, constant:10),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-10),
            containerView.heightAnchor.constraint(equalToConstant:60),
            
            nameLabel.topAnchor.constraint(equalTo:self.containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor),
            
            locationLabel.bottomAnchor.constraint(equalTo:self.typeLabel.topAnchor ),
            locationLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor),
            
            typeLabel.bottomAnchor.constraint(equalTo:self.containerView.bottomAnchor),
            typeLabel.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            typeLabel.trailingAnchor.constraint(equalTo:self.containerView.trailingAnchor)
        ])
    }
    
}
