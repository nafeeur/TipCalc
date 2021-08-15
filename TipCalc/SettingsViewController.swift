//
//  SettingsViewController.swift
//  TipCalc
//
//  Created by Nafeeur on 8/13/21.
//

import UIKit

protocol settingsViewDelegate {
    func pass(string:String )
}

class SettingsViewController: UIViewController {
  
    @IBOutlet weak var button: UIButton!
    
    var delegate: settingsViewDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        delegate?.pass(string: "dark")
        view.backgroundColor = UIColor(red: 0.184, green: 0.184, blue: 0.184, alpha: 1.00)
        animate()
     
    }
    
    @objc func animate(){
        UIButton.animate(withDuration: 1.5, animations:{
             
             self.button.alpha = 0.0
             
         })
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
