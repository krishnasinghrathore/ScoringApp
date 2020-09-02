//
//  RoundViewController.swift
//  standaloneScoring
//
//  Created by Apple on 14/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class RoundViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var txtHeader = "ROUND ROBIN"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "RoundRobinTableViewCell") as! RoundRobinTableViewCell?)!
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "RoundTargetScreenViewController") as? RoundTargetScreenViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }

    @IBOutlet weak var lblHeader: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblHeader.text = txtHeader
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
        
    @IBAction func btnStandings(_ sender: Any) {
        let winnerVC = (self.storyboard?.instantiateViewController(withIdentifier: "StandingsViewController") as? StandingsViewController)!
        self.navigationController?.pushViewController(winnerVC, animated: true)
    }
    @IBAction func btnComplete(_ sender: Any) {
        let winnerVC = (self.storyboard?.instantiateViewController(withIdentifier: "ChooseGameViewController") as? ChooseGameViewController)!
        self.navigationController?.pushViewController(winnerVC, animated: true)
    }
}
