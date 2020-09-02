//
//  NewSessionViewController.swift
//  standaloneScoring
//
//  Created by Apple on 12/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class NewSessionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
   
    @IBAction func btnAddMember(_ sender: Any) {
        let chooseSessionVC = (self.storyboard?.instantiateViewController(withIdentifier: "TeamMemberDetailViewController") as? TeamMemberDetailViewController)!
        self.navigationController?.pushViewController(chooseSessionVC, animated: true)
    }
    @IBAction func btnLoadMember(_ sender: Any) {
        let gameStoryBoard = UIStoryboard(name: "Games", bundle: nil)
        let chooseSessionVC = (gameStoryBoard.instantiateViewController(withIdentifier: "ChooseGameViewController") as? ChooseGameViewController)!
        self.navigationController?.pushViewController(chooseSessionVC, animated: true)
    }
    
    @IBAction func btnLoadTeam(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)        
    }

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30;
    }
    
    func tableView(_ tableView: UITableView,
                    leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
     {
         let editAction = UIContextualAction(style: .normal, title:  "Edit", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
                 success(true)
             })
    editAction.backgroundColor = .black

             return UISwipeActionsConfiguration(actions: [editAction])
     }

     func tableView(_ tableView: UITableView,
                    trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
     {
         let deleteAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
             success(true)
         })
         deleteAction.backgroundColor = .red

         return UISwipeActionsConfiguration(actions: [deleteAction])
     }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell") as! MemberTableViewCell?)!
               
               // set the text from the data model
        cell.textLabel?.text = "Player Name \(indexPath.row)"
            
        return cell
    }
}
