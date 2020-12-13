
import UIKit

class StaticTabel: UITableViewCell {
    
    let labelDescription : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(labelDescription)
        self.contentView.addSubview(textField)
        self.selectionStyle = .none
        constraints ()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func constraints () {
        labelDescription.leftAnchor.constraint(equalTo:self.contentView.leftAnchor,constant: 16).isActive = true
        labelDescription.topAnchor.constraint(equalTo:self.contentView.topAnchor).isActive = true
         
        textField.leftAnchor.constraint(equalTo:self.contentView.leftAnchor, constant: 16).isActive = true
        textField.topAnchor.constraint(equalTo:self.labelDescription.bottomAnchor).isActive = true
        textField.rightAnchor.constraint(equalTo:self.contentView.rightAnchor,constant: -16).isActive = true
        textField.bottomAnchor.constraint(equalTo:self.contentView.bottomAnchor).isActive = true
    }
}
