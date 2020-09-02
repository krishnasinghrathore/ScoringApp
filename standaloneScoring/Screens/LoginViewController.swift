//
//  LOGINViewController.swift
//  standaloneScoring
//
//  Created by Apple on 11/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtUserName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    func designEnhancements() {
        btnLogin.layer.cornerRadius = 30.0
        btnLogin.clipsToBounds = true
    }
    
    func successLogin() {
        let storyBoard = UIStoryboard(name: "Session", bundle: nil)
        let chooseSessionVC = storyBoard.instantiateViewController(withIdentifier: "ChooseSessionViewController") as! ChooseSessionViewController
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let navigationController = UINavigationController.init(rootViewController: chooseSessionVC)
        appDelegate.window?.rootViewController = navigationController
    }
    
    @IBAction func btnLogin(_ sender: Any) {
        self.showSpinner(onView: self.view)

        let parameters: Parameters = [
            "UserName": "admin",
            "Password": "Admin@123"
        ]
        
        ApiManager.shared.post(url: APIEndPoint.baseurl + APIEndPoint.login, param: parameters) { (response,success,message)  in
            self.removeSpinner()
            self.displayAlert(onView: self, message: message, onPressOk: {
                () in
                if (success) {
                    self.successLogin()
                }
            })
        }
    }
    
    @IBAction func btnSignUp(_ sender: Any) {
        let sessionVC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(sessionVC, animated: true)
    }
}
