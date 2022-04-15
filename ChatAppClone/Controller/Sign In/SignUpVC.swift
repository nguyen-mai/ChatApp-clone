//
//  SignUpVC.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/7.
//

import UIKit

class SignUpVC: UIViewController {
    
    @IBOutlet var backButton: UIButton!
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var checkBox: CheckBoxButton!
    @IBOutlet var privacyLabel: UILabel!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var signInLabel: UILabel!
    @IBOutlet var signInButton: UIButton!
    
    var myString = "I agree to terms and policies."
    var myMutableString = NSMutableAttributedString()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customUI()
    }
    
    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func customUI() {
        Custom.custom.customLabel(label: signUpLabel, text: "Sign Up", font: "Lato-Bold", size: 32, color: .mainColor)

        Custom.custom.customLabel(label: nameLabel, text: "Name".uppercased(), font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customLabel(label: emailLabel, text: "Email".uppercased(), font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customLabel(label: passwordLabel, text: "Password".uppercased(), font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customLabel(label: signInLabel, text: "Sign Up", font: "Lato-Bold", size: 32, color: .mainColor)
        
        Custom.custom.customTextField(textfield: nameTextField, text: "Enter name...", font: "Lato-Regular", size: 18, color: .black, icon: "unselectedUser")
        Custom.custom.customTextField(textfield: emailTextField, text: "Enter email...", font: "Lato-Regular", size: 18, color: .black, icon: "unselectedMail")
        Custom.custom.customTextField(textfield: passwordTextField, text: "Enter password...", font: "Lato-Regular", size: 18, color: .black, icon: "unselectedKey")
        
        
        Custom.custom.customBackgroundBtn(button: signUpButton, text: "Sign Up".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .lightGrayColor)
        
        Custom.custom.customLabel(label: signInLabel, text: "Do have an account?", font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customButton(button: signInButton, text: "Sign In", font: "Lato-Regular", size: 14, color: .mainColor)
        
        myMutableString = NSMutableAttributedString(string: myString, attributes: [NSAttributedString.Key.font: UIFont(name: "Lato-Regular", size: 14.0)!])
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.mainColor, range: NSRange(location: 11, length: 5))
        myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.mainColor, range: NSRange(location: 20, length: 9))
        privacyLabel.attributedText = myMutableString
    }
    
    func handleTextField() {
        nameTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged() {
        guard let name = nameTextField.text else {
            return
        }
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
        }
        if name.isEmpty {
            Custom.custom.customIcon(textfield: nameTextField, icon: "unselectedUser")
        } else {
            Custom.custom.customIcon(textfield: nameTextField, icon: "selectedUser")
        }
        
        if email.isEmpty {
            Custom.custom.customIcon(textfield: emailTextField, icon: "unselectedMail")
        } else {
            Custom.custom.customIcon(textfield: emailTextField, icon: "selectedMail")
        }
        if password.isEmpty {
            Custom.custom.customIcon(textfield: passwordTextField, icon: "unselectedKey")
        } else {
            Custom.custom.customIcon(textfield: passwordTextField, icon: "selectedKey")
        }
        if email.isEmpty || password.isEmpty {
            Custom.custom.customBackgroundBtn(button: signUpButton, text: "Sign Up".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .lightGrayColor)
        } else {
            Custom.custom.customBackgroundBtn(button: signUpButton, text: "Sign Up".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .mainColor)
        }
    }
    
    
}
