//
//  LoginViewController.swift
//  TF_ADG_IOS_FUND
//
//  Created by Alaene Sousa on 24/10/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    func setupView() {
        loginButton.layer.cornerRadius = 16
        loginButton.addTarget(self, action: #selector(openHomeView), for: .touchUpInside)
        passwordTextField.isSecureTextEntry = true
        title = "Faça seu login"
    }
    
    @objc func openHomeView() {
        saveData()
    }
    
    func saveData() {
        let homeVC = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "homeVCID") as! HomeViewController
        
        let username = emailTextField.text
        let password = passwordTextField.text
        
        if !isValidUser(user: emailTextField.text ?? "") || !isValidPass(pass: passwordTextField.text ?? "") {
            openAlert()
        } else {
            userDefaults.setValue(username, forKey: "username")
            userDefaults.setValue(password, forKey: "password")
            navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    func openAlert() {
        let alert = UIAlertController(title: "Ops! Algo deu errado.",
                                      message: "Para continuar preencha todos os campos corretamente.",
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { action in
            print("voce esta igual a Karol com K: Cancelado")
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func isValidPass(pass: String) -> Bool {
        return pass.count > 8 || pass == "" ? false : true
    }
    
    func isValidUser(user: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: user)
    }
}
