//
//  EliminationViewController.swift
//  standaloneScoring
//
//  Created by Apple on 23/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class EliminationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:EliminationTableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "EliminationTableViewCell") as! EliminationTableViewCell?)!
                           
        cell.lblRound.text = "Round \(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "RoundViewController") as? RoundViewController)!
        roundVC.txtHeader = "ELIMINATION ROUND \(indexPath.row + 1)"
        self.navigationController?.pushViewController(roundVC, animated: true)
    }

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
}
