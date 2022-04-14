//
//  SignInVC.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/7.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet var titleAppLabel: UILabel!
    @IBOutlet var signInLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var signUpLabel: UILabel!
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var resetPasswordBtn: UIButton!
    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customUI()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func resetPasswordTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ResetPasswordVC") as! ResetPasswordVC
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func customUI() {
        
        hideNavigationBar(animated: true)
        
        Custom.custom.customLabel(label: titleAppLabel, text: "ChatApp clone", font: "Lato-Light", size: 26, color: .black)
        Custom.custom.customLabel(label: signInLabel, text: "Sign In", font: "Lato-Bold", size: 32, color: .mainColor)
        Custom.custom.customLabel(label: emailLabel, text: "Email".uppercased(), font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customLabel(label: passwordLabel, text: "Password".uppercased(), font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customLabel(label: signUpLabel, text: "Haven't you an account?", font: "Lato-Regular", size: 14, color: .gray)
        
        Custom.custom.customTextField(textfield: emailTextField, text: "Enter email...", font: "Lato-Regular", size: 18, color: .black, icon: "unselectedMail")
        Custom.custom.customTextField(textfield: passwordTextField, text: "Enter password...", font: "Lato-Regular", size: 18, color: .black, icon: "unselectedKey")
        
        Custom.custom.customButton(button: resetPasswordBtn, text: "Forgot password?", font: "Lato-Bold", size: 12, color: .mainColor)
        Custom.custom.customButton(button: signUpBtn, text: "Sign Up", font: "Lato-Regular", size: 14, color: .mainColor)
        Custom.custom.customBackgroundBtn(button: signInBtn, text: "Sign In".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .lightGrayColor)
        
        handleTextField()
        
    }
    
    func handleTextField() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged() {
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordTextField.text else {
            return
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
            Custom.custom.customBackgroundBtn(button: signInBtn, text: "Sign In".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .lightGrayColor)
        } else {
            Custom.custom.customBackgroundBtn(button: signInBtn, text: "Sign In".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .mainColor)
        }
    }
    
}
