
import UIKit

final class NewPlaceInputTabelViewCell: UITableViewCell {
    
    let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionTF: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        descriptionTF.delegate = self
        
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(descriptionTF)
        backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9529411765, blue: 0.9411764706, alpha: 1)
        selectionStyle = .none
        
        setupConstraints ()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints () {
        NSLayoutConstraint.activate([
            descriptionLabel.leftAnchor.constraint(equalTo:self.contentView.leftAnchor,constant: 16),
            descriptionLabel.topAnchor.constraint(equalTo:self.contentView.topAnchor),
            descriptionTF.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant: 16),
            descriptionTF.topAnchor.constraint(equalTo:self.descriptionLabel.bottomAnchor),
            descriptionTF.rightAnchor.constraint(equalTo:self.contentView.rightAnchor,constant: -16),
            descriptionTF.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor)
        ])
    }
    
}

extension NewPlaceInputTabelViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
