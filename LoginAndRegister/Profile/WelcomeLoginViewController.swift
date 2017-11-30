//
//  WelcomeLoginViewController.swift
//  LoginAndRegister
//
//  Created by Sharad on 28/11/17.
//  Copyright © 2017 Sharad. All rights reserved.
//

import UIKit

class WelcomeLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
    @IBAction func logOut(_ sender: Any) {
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        if !isLoggedIn {
            print("Please Login First")
            UserDefaults.standard.set(false, forKey: "isLoggedIn")
            let newViewController = LoginViewController()
            self.navigationController?.pushViewController(newViewController, animated: true)
        } else {
            
            
            
            
        }
    }
    
}
