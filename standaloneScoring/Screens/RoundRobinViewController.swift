//
//  RoundRobinViewController.swift
//  standaloneScoring
//
//  Created by Apple on 21/08/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import UIKit

class RoundRobinViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
     AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       let collectionViewSize = collectionView.frame.size.width

       return CGSize(width: collectionViewSize/2, height: collectionViewSize/4)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = ((self.collectionView.dequeueReusableCell(withReuseIdentifier: "OpenSessionCollectionViewCell", for: indexPath) as! OpenSessionCollectionViewCell))
                      
                      // set the text from the data model
//               cell.textLabel?.text = "Member \(indexPath.row)"
                   
        return cell
    }
    @IBAction func btnGenerateMatch(_ sender: Any) {
        let roundVC = (self.storyboard?.instantiateViewController(withIdentifier: "RoundViewController") as? RoundViewController)!
        self.navigationController?.pushViewController(roundVC, animated: true)
    }
}
