//
//  Custom.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/8.
//

import Foundation
import UIKit

class Custom {
    
    static let custom = Custom()
    
    func customLabel(label: UILabel, text: String, font: String, size: CGFloat, color: UIColor) {
        label.text = text
        label.font = UIFont(name: font, size: size)
        label.textColor = color
    }
    
    func customTextField(textfield: UITextField, text: String, font: String, size: CGFloat, color: UIColor, icon: String) {
        // Custom textfield
        textfield.backgroundColor = UIColor.clear
        textfield.placeholder = text
        textfield.borderStyle = .none
        textfield.font = UIFont(name: font, size: size)
        textfield.textColor = color
        textfield.keyboardType = .emailAddress
        textfield.returnKeyType = .done
        
        // custom textfield {
        // Create the bottom line
        let bottomLine = CALayer()
        bottomLine.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 60/255, alpha: 1).cgColor
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 5, width: textfield.frame.width - 25, height: 0.8)
        textfield.layer.addSublayer(bottomLine)
        
        // For adding an Image on right side
        textfield.rightViewMode = .always
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let iconContainerView: UIView = UIView(frame:
                          CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        textfield.rightView = iconContainerView
        iconView.image = UIImage(named: icon)
    }
    
    func customIcon(textfield: UITextField, icon: String) {
        // For adding an Image on right side
        textfield.rightViewMode = .always
        let iconView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let iconContainerView: UIView = UIView(frame:
                          CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        textfield.rightView = iconContainerView
        iconView.image = UIImage(named: icon)
    }
    
    func customTextFieldInput(textfield: UITextField, leftIcon: String, rightIcon: String) {
        // For adding an Image on right side
        textfield.leftViewMode = .always
        let iconLeftView = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let iconLeftContainerView: UIView = UIView(frame:
                          CGRect(x: 20, y: 0, width: 30, height: 30))
        iconLeftContainerView.addSubview(iconLeftView)
        textfield.leftView = iconLeftContainerView
        iconLeftView.setImage(UIImage(named: leftIcon), for: .normal)
        
        // For adding an Image on right side
//        textfield.rightViewMode = .always
//        let iconRightView = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        let iconRightContainerView: UIView = UIView(frame:
//                          CGRect(x: 20, y: 0, width: 30, height: 30))
//        iconRightContainerView.addSubview(iconRightView)
//        textfield.rightViewMode = iconRightContainerView
//        iconRightView.setImage(UIImage(named: rightIcon), for: .normal)
    }
    
    func customButton(button: UIButton, text: String, font: String, size: CGFloat, color: UIColor) {
        button.setTitle(text, for: .normal)
        button.setTitleColor(color, for: .normal)
        button.titleLabel?.font = UIFont(name: font, size: size)
        button.tintColor = color
    }
    
    func customBackgroundBtn(button: UIButton, text: String, font: String, size: CGFloat, textColor: UIColor, backgroundColor: UIColor) {
        button.setTitle(text, for: .normal)
        button.setTitleColor(textColor, for: .normal)
        button.titleLabel?.font = UIFont(name: font, size: size)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = button.frame.height / 2
        button.tintColor = textColor
    }
}

class CheckBoxButton: UIButton {
    let checkedImage = UIImage(named: "checked")! as UIImage
    let uncheckedImage = UIImage(named: "unchecked")! as UIImage
    
    // bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        self.isChecked = false
    }
    
    @objc func buttonClicked() {
        self.isChecked = !isChecked
    }
}
