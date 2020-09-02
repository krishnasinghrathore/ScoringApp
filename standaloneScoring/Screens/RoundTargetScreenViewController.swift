//
//  RoundTargetScreenViewController.swift
//  standaloneScoring
//
//  Created by Apple on 19/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class RoundTargetScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if(tableView == tableView1) {
            let cell = (self.tableView1.dequeueReusableCell(withIdentifier: "NameTableViewCell1") as! NameTableViewCell?)!
            cell.textLabel?.text = "\(indexPath.row+1). Name"
            return cell
        } else if(tableView == tableView2) {
            let cell = (self.tableView2.dequeueReusableCell(withIdentifier: "NameTableViewCell2") as! NameTableViewCell?)!
            cell.textLabel?.text = "\(indexPath.row+1). Name"
            return cell
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
      AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.landscapeLeft, andRotateTo: UIInterfaceOrientation.landscapeLeft)
      }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnDone(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
