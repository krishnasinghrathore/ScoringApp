//
//  TeamMemberDetailViewController.swift
//  standaloneScoring
//
//  Created by Apple on 12/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class TeamMemberDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    @IBAction func btnDone(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)    }
}
