//
//  ChooseGameViewController.swift
//  standaloneScoring
//
//  Created by Apple on 21/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class ChooseGameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    @IBAction func btnRoundRobin(_ sender: Any) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "RoundViewController") as? RoundViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
    
    @IBAction func btnElimination(_ sender: Any) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "EliminationViewController") as? EliminationViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
    
    @IBAction func btnGame21(_ sender: Any) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "Game21ViewController") as? Game21ViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
    
    @IBAction func btnAroundTheWorld(_ sender: Any) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "AroundTheWorldViewController") as? AroundTheWorldViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
    
    @IBAction func btnClearSession(_ sender: Any) {
        let alertController = UIAlertController(title: "Are you sure you want to clear the session?", message: "", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Yes", style: .default, handler: { alert -> Void in
            let alert = UIAlertController(title: "", message: "Session cleared successfully!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: { alert -> Void in
                let mainStoryBoard = UIStoryboard(name: "Session", bundle: nil)
                let chooseSessionVC = mainStoryBoard.instantiateViewController(withIdentifier: "ChooseSessionViewController") as! ChooseSessionViewController
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                let navigationController = UINavigationController.init(rootViewController: chooseSessionVC)
                appDelegate.window?.rootViewController = navigationController
            }))
            self.present(alert, animated: true, completion: nil)
        })
        let noAction = UIAlertAction(title: "No", style: .default, handler: { (action : UIAlertAction!) -> Void in })
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
