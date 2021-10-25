//
//  HomeViewController.swift
//  TF_ADG_IOS_FUND
//
//  Created by Alaene Sousa on 24/10/21.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var basicLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var outButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupView()
    }
    
    func setupView() {
        view.backgroundColor = .white
        title = "Bem Vindo(a)!"
        navigationItem.hidesBackButton = true
        loadData()
        outButton.layer.cornerRadius = 16
        outButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }

    func loadData() {
        let userDefaults = UserDefaults()
        usernameLabel.text = userDefaults.string(forKey: "username")
    }
    
    @objc func logout() {
        UserDefaults.standard.removeObject(forKey: "username")
        UserDefaults.standard.removeObject(forKey: "password")
        navigationController?.popViewController(animated: true)
    }
}
