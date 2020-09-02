
//
//  WinnerDeclarationViewController.swift
//  standaloneScoring
//
//  Created by Apple on 15/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class WinnerDeclarationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
      
    override func viewWillAppear(_ animated: Bool) {
  AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeLeft, andRotateTo: UIInterfaceOrientation.landscapeLeft)
    }
    @IBAction func btnExit(_ sender: Any) {
        let mainStoryBoard = UIStoryboard(name: "main", bundle: nil)
               let chooseSessionVC = mainStoryBoard.instantiateViewController(withIdentifier: "ChooseSessionViewController") as! ChooseSessionViewController
               let appDelegate = UIApplication.shared.delegate as! AppDelegate
               let navigationController = UINavigationController.init(rootViewController: chooseSessionVC)
               appDelegate.window?.rootViewController = navigationController        
    }
}
