//
//  ChooseSessionViewController.swift
//  standaloneScoring
//
//  Created by Apple on 12/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class ChooseSessionViewController: UIViewController {
    @IBOutlet weak var btnNewSession: UIButton!
    
    @IBOutlet weak var btnOpenSession: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    @IBAction func btnOpenSession(_ sender: Any) {
        let chooseSessionVC = (self.storyboard?.instantiateViewController(withIdentifier: "OpenSessionViewController") as? OpenSessionViewController)!
        self.navigationController?.pushViewController(chooseSessionVC, animated: true)
    }
    
    @IBAction func btnNewSession(_ sender: Any) {
        let chooseSessionVC = (self.storyboard?.instantiateViewController(withIdentifier: "NewSessionViewController") as? NewSessionViewController)!
        self.navigationController?.pushViewController(chooseSessionVC, animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
