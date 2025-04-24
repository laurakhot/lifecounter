//
//  HistoryViewController.swift
//  lifecounter
//
//  Created by Laura Khotemlyansky on 4/23/25.
//

import UIKit

class HistoryViewController: UIViewController {
    
    var history : [String] = []
    
   
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textLabel.text = history.joined(separator: "\n")
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        self.dismiss(animated: true)
        performSegue(withIdentifier: "toHome", sender: self)
    }

}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


