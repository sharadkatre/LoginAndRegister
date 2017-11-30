//
//  LogoutViewController.swift
//  LoginAndRegister
//
//  Created by Sharad on 29/11/17.
//  Copyright © 2017 Sharad. All rights reserved.
//

import UIKit

class LogoutViewController: UIViewController {
    
    
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var aboutButton: UIButton!
    
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var profileButton: UIButton!
    
    @IBOutlet var paymentButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
        profileImageView.layer.cornerRadius = 50
        
        profileButton.layer.borderColor = UIColor.white.cgColor
        profileButton.layer.borderWidth = 1
        profileButton.layer.cornerRadius = 10

        settingsButton.layer.borderColor = UIColor.white.cgColor
        settingsButton.layer.borderWidth = 1
        settingsButton.layer.cornerRadius = 10

        paymentButton.layer.borderColor = UIColor.white.cgColor
        paymentButton.layer.borderWidth = 1
        paymentButton.layer.cornerRadius = 10

        aboutButton.layer.borderColor = UIColor.white.cgColor
        aboutButton.layer.borderWidth = 1
        aboutButton.layer.cornerRadius = 10

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func viewProfile(_ sender: Any) {
    }
    
    @IBAction func paymentOptions(_ sender: Any) {
    }
    
    @IBAction func about(_ sender: Any) {
    }
    
    
    @IBAction func viewSettings(_ sender: Any) {
    }
    
    
    
    @IBAction func logoutAction(_ sender: Any) {
        
        var isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        if isLoggedIn == true {
            isLoggedIn = false
        }
        print("Logging Out \(isLoggedIn)")
        UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        self.performSegue(withIdentifier: "logOut", sender: self)
        
    }
    
}


