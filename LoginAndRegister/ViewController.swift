//
//  ViewController.swift
//  LoginAndRegister
//
//  Created by Sharad on 27/11/17.
//  Copyright © 2017 Sharad. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var homepageView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil )
        UIApplication.shared.statusBarStyle = .lightContent
        
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        
        print("First Load User Logged In \(isLoggedIn)")

        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        homepageView.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

