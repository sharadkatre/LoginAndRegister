//
//  SignUpViewController.swift
//  LoginAndRegister
//
//  Created by Sharad on 27/11/17.
//  Copyright © 2017 Sharad. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class SignUpViewController: UIViewController {
    @IBOutlet var signUpView: UIView!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var confirmTextField: UITextField!
    @IBOutlet var chechButton: UIButton!
    
    var termStatus: Bool = false
    var userName: String = ""
    var email: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var data: SignInUp? = nil
    
    @objc let persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil )

        
        signUpView.layer.shadowColor = UIColor.black.cgColor
        signUpView.layer.shadowOffset = CGSize(width: 2, height: 2)
        signUpView.layer.shadowOpacity = 0.5
        signUpView.layer.shadowRadius = 2
        signUpView.layer.cornerRadius = 5
        
        chechButton.layer.borderColor =  UIColor.black.cgColor

        chechButton.layer.borderWidth = 2
        
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

    @IBAction func passwordSecurity(_ sender: Any) {
        
        let status = passwordTextField.isSecureTextEntry
        if status == true {
            
            passwordTextField.isSecureTextEntry = false
            
        } else {
            
            passwordTextField.isSecureTextEntry = true
            
        }
    }
    
    @IBAction func resignResponder(_ sender: Any) {
        
        self.resignFirstResponder()
        
    }
    
    
    @IBAction func signUpProcess(_ sender: Any) {
        
        
        
        userName = usernameTextField.text!
        email = emailTextField.text!
        password = passwordTextField.text!
        confirmPassword = confirmTextField.text!
        
        if userName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty {
          
            print("All Fields Are Required")
            let alert = UIAlertController(title: "Error!!", message: "All Fields Are Required", preferredStyle: .alert)
            
            let dismisButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            alert.addAction(dismisButton)
            
            self.present(alert, animated: true, completion: nil)
            
        } else if termStatus == false {
            
            print("Please Check Terms And Conditions")
            let alert = UIAlertController(title: "Error!!", message: "Please Check Terms And Conditions", preferredStyle: .alert)
            
            let dismisButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            alert.addAction(dismisButton)
            
            self.present(alert, animated: true, completion: nil)
            
        } else if password != confirmPassword {
        
            print("Password Does Not Match")
            let alert = UIAlertController(title: "Error!!", message: "Password Does Not Match", preferredStyle: .alert)
            
            let dismisButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            alert.addAction(dismisButton)
            
            self.present(alert, animated: true, completion: nil)
            
        
        } else {
            
            UserDefaults.standard.set(userName, forKey: "userName")
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(password, forKey: "password")
            UserDefaults.standard.set(termStatus, forKey: "termsStatus")
            UserDefaults.standard.synchronize()

            let alert = UIAlertController(title: "Success", message: "Registered Successfully", preferredStyle: .alert)
            
            let dismisButton = UIAlertAction(title: "Dismiss", style: .cancel, handler: {
                (alert: UIAlertAction!) -> Void in
            })
            
            alert.addAction(dismisButton)
            
            self.present(alert, animated: true, completion: nil)
            
            self.dismiss(animated: true, completion: nil)
            
//            //  Go to the LoginViewController
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpSuccessfull")
//            self.present(vc!, animated: true, completion: nil)
//            
            
            print("Registered Successfull...Thank You")
            
            
        }
    
        
    }

    @IBAction func chechTermsAndConditions(_ sender: Any) {
        var image = UIImage()
        if termStatus == false {
            
            image = UIImage(named: "group6")!
            termStatus = true
            chechButton.setImage(image, for: .normal)
            print(termStatus)
        } else {
            termStatus = false
            image = UIImage(named: "unchecked")!

            chechButton.setImage(image, for: .normal)
            print(termStatus)

        }
        
        
    }
    
    
    
}
