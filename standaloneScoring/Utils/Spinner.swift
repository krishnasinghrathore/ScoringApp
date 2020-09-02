//
//  Spinner.swift
//  standaloneScoring
//
//  Created by Apple on 02/09/20.
//  Copyright © 2020 Nick Harder. All rights reserved.
//

import Foundation
import UIKit

var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(onView : UIView) {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(style: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
    
    func displayAlert(onView: UIViewController, message: String, onPressOk: @escaping()-> Void) {
        let alertController = UIAlertController(title: "Scoring App", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "No", style: .default, handler: { alert -> Void in
            onPressOk()
            })
        alertController.addAction(action)
        onView.present(alertController, animated: true, completion: nil)
    }
}
