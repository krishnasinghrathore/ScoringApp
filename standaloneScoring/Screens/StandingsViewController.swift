//
//  StandingsViewController.swift
//  standaloneScoring
//
//  Created by Apple on 21/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class StandingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return 30;
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "StandingsTableViewCell") as! StandingsTableViewCell?)!
                 
                 // set the text from the data model
//          cell.textLabel?.text = "Group Name-Group\(indexPath.row) Time-2:20pm"
              
          return cell
      }

    @IBAction func btnDone(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
