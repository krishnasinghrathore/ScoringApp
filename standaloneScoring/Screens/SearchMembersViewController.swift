//
//  SearchMembersViewController.swift
//  standaloneScoring
//
//  Created by Apple on 12/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class SearchMembersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
        
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell") as! MemberTableViewCell?)!
               
               // set the text from the data model
        cell.textLabel?.text = "Member \(indexPath.row)"
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .checkmark
            {
                cell.accessoryType = .none
            }
            else
            {
                cell.accessoryType = .checkmark
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDone(_ sender: Any) {
        let chooseSessionVC = (self.storyboard?.instantiateViewController(withIdentifier: "TeamMemberDetailViewController") as? TeamMemberDetailViewController)!
        self.navigationController?.pushViewController(chooseSessionVC, animated: true)
    }
}

