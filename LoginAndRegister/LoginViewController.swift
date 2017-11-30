//
//  LoginViewController.swift
//  LoginAndRegister
//
//  Created by Sharad on 27/11/17.
//  Copyright © 2017 Sharad. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var loginView: UIView!
    
    @IBOutlet var forgetPasswordButton: UIButton!
    @IBOutlet var incorrectUsernamePasswordLabel: UILabel!
    @IBOutlet var signUpLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    var isLoggedIn = false
    
    var loginViewController: LoginViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil )

        
        loginView.layer.shadowColor = UIColor.black.cgColor
        loginView.layer.shadowOffset = CGSize(width: 2, height: 2)
        loginView.layer.shadowOpacity = 0.5
        loginView.layer.shadowRadius = 2
        loginView.layer.cornerRadius = 5
        
        
        incorrectUsernamePasswordLabel.isHidden = true
        forgetPasswordButton.isHidden = true

        
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

    @IBAction func securePassword(_ sender: Any) {
        
        let status = passwordTextField.isSecureTextEntry
        if status == true {
            
            passwordTextField.isSecureTextEntry = false

        } else {

            passwordTextField.isSecureTextEntry = true

        }
    }
    
    
    @IBAction func releaseResponder(_ sender: Any) {
        
        self.resignFirstResponder()
        
    }
    
    
    @IBAction func signInProcess(_ sender: Any) {
        
        let semail = UserDefaults.standard.string(forKey: "email")
        let spsw = UserDefaults.standard.string(forKey: "password")
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        
        if (semail == email) && (password == spsw) {
            isLoggedIn = true
            
            incorrectUsernamePasswordLabel.isHidden = true
            forgetPasswordButton.isHidden = true
            
            print("Unable to Switch View")
            
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
            UserDefaults.standard.synchronize()
            
            //  Go to the WelcomeProfileViewController
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
            self.present(vc!, animated: true, completion: nil)
            
        } else {

            let alert = UIAlertController(title: "Alert", message: "Login Failed", preferredStyle: .alert)
            
            let dismisButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            isLoggedIn = false
            print("Logged in \(isLoggedIn) ")

            forgetPasswordButton.isHidden = false
            incorrectUsernamePasswordLabel.isHidden = false
            
            alert.addAction(dismisButton)
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
//        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "forgetPass")
//        self.present(vc!, animated: true, completion: nil)
        
    }
    
    @IBAction func facebookSignUp(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "http://www.facebook.com/")!)
        
    }
    
    
}
