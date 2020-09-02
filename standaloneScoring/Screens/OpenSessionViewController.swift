//
//  OpenSessionViewController.swift
//  standaloneScoring
//
//  Created by Apple on 13/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class OpenSessionViewController: UIViewController,UITableViewDataSource , UITableViewDelegate {
    
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
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: "MemberTableViewCell") as! MemberTableViewCell?)!
               
               // set the text from the data model
        cell.textLabel?.text = "Group Name-Group\(indexPath.row) Time-2:20pm"
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "NewSessionViewController") as? NewSessionViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
    
    @IBAction func btnGenerateMatch(_ sender: Any) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "RoundViewController") as? RoundViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
}
