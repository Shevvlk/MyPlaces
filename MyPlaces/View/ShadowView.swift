
import UIKit

final class ShadowView: UIView {
    
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    private let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        setupShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupShadow() {
        layer.cornerRadius = 35
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.isGeometryFlipped = false
    }
    
    private func setupImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
    }
}
