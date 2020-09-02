//
//  SignUpViewController.swift
//  standaloneScoring
//
//  Created by Apple on 12/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
   
    @IBAction func btnSignUp(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "main", bundle: nil)
        let chooseSessionVC = mainStoryBoard.instantiateViewController(withIdentifier: "ChooseSessionViewController") as! ChooseSessionViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = chooseSessionVC
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
