//
//  ResetPasswordVC.swift
//  ChatAppClone
//
//  Created by Apple on 2022/4/7.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var resetBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customUI()
    }

    @IBAction func backTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    private func customUI() {
        Custom.custom.customLabel(label: titleLabel, text: "Please enter your email", font: "Lato-Bold", size: 32, color: .mainColor)
        Custom.custom.customLabel(label: emailLabel, text: "Email".uppercased(), font: "Lato-Regular", size: 14, color: .gray)
        Custom.custom.customTextField(textfield: emailTextfield, text: "Enter email...", font: "Lato-Regular", size: 18, color: .black, icon: "unselectedMail")
        
        Custom.custom.customBackgroundBtn(button: resetBtn, text: "Send".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .lightGrayColor)
        
        handleTextField()
    }
    
    private func handleTextField() {
        emailTextfield.addTarget(self, action: #selector(textFieldDidChanged), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged() {
        guard let email = emailTextfield.text else {
            return
        }
        if email.isEmpty {
            Custom.custom.customIcon(textfield: emailTextfield, icon: "unselectedMail")
            Custom.custom.customBackgroundBtn(button: resetBtn, text: "Send".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .lightGrayColor)
        } else {
            Custom.custom.customIcon(textfield: emailTextfield, icon: "selectedMail")
            Custom.custom.customBackgroundBtn(button: resetBtn, text: "Send".uppercased(), font: "Lato-Bold", size: 16, textColor: .white, backgroundColor: .mainColor)
        }
    }

}
