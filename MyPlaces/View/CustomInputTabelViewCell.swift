
import UIKit

class CustomInputTabelViewCell: UITableViewCell {
    
    let labelDescription : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let textFieldDescription: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(labelDescription)
        self.contentView.addSubview(textFieldDescription)
        self.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9529411765, blue: 0.9411764706, alpha: 1)
        self.selectionStyle = .none
        constraints ()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func constraints () {
        labelDescription.leftAnchor.constraint(equalTo:self.contentView.leftAnchor,constant: 16).isActive = true
        labelDescription.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
        
        textFieldDescription.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant: 16).isActive = true
        textFieldDescription.topAnchor.constraint(equalTo:self.labelDescription.bottomAnchor).isActive = true
        textFieldDescription.rightAnchor.constraint(equalTo:self.contentView.rightAnchor,constant: -16).isActive = true
        textFieldDescription.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
    }
}
