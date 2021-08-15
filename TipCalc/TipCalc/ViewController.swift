//
//  ViewController.swift
//  TipCalc
//
//  Created by Nafeeur on 8/13/21.
//

import UIKit

class ViewController: UIViewController, settingsViewDelegate{
   
    

    
    @IBOutlet weak var Dollar: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var eachLabel: UILabel!
    @IBOutlet weak var eachAmount: UILabel!
    @IBOutlet weak var step: UIStepper!
    @IBOutlet weak var personNum: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var TitleLabel: UIButton!
    @IBOutlet weak var subview: UIView!
    @IBOutlet weak var seg: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.billAmountTextField.becomeFirstResponder()
        UIView.animate(withDuration:0.8, delay: 0.0,
           // Autoreverse runs the animation backwards and Repeat cycles the animation indefinitely.
           options: [.autoreverse,.repeat], animations: { () -> Void in
              self.TitleLabel.transform = CGAffineTransform(translationX: 0, y: 10)
           }, completion: nil)
       
        }
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SettingsViewController {
            destination.delegate = self
        }
    }
    
   
    @IBAction func segChange(_ sender: Any) {
        calculateBill()
    }
    

    func pass(string: String) {
        darkMode()
        
    }

    @IBAction func resetPressed(_ sender: Any) {
        clear()
      
    }
    
    
    @IBAction func editValueTextField(_ sender: Any) {
        calculateBill()
        
    }
    
    
    @IBAction func step2value(_ sender: Any) {
        let p = String(Int(step.value))
                personNum.text = String(p + " PERSON")
        calculateBill()
               
    }

    @IBAction func sliderValueChange(_ sender: Any) {
        tipPercent.text = String(format:"%2d%%", Int(slider.value))
               calculateBill()
    }
    
    
   func calculateBill() {
        if seg.selectedSegmentIndex == 0 {dollar()}
        if seg.selectedSegmentIndex == 1 {pound()}
        if seg.selectedSegmentIndex == 2 {euro()}
    
   }
        
    func clear() {
        billAmountTextField.text = nil
        totalAmount.text = "0.00"
        eachAmount.text = "0.00"
        slider.value = 0
        tipPercent.text = String(format:"%2d%%", Int(slider.value))
        step.value = 1
        let p = String(Int(step.value))
                personNum.text = String(p + " Person")
   
    }
    

    func darkMode(){
      
        subview.backgroundColor = UIColor(red: 0.172, green: 0.172, blue: 0.172, alpha: 1.00)
        view.backgroundColor = UIColor(red: 0.117, green: 0.117, blue: 0.117, alpha: 1.00)
          eachLabel.textColor = UIColor(red: 0.819, green: 0.819, blue: 0.819, alpha: 1.00)
        totalAmount.textColor = UIColor(red: 0.819, green: 0.819, blue: 0.819, alpha: 1.00)
        tipPercent.textColor = UIColor(red: 0.819, green: 0.819, blue: 0.819, alpha: 1.00)
          billAmountTextField.backgroundColor = UIColor(red: 0.172, green: 0.172, blue: 0.172, alpha: 1.00)
          Dollar.textColor = UIColor(red: 0.819, green: 0.819, blue: 0.819, alpha: 1.00)
          tipAmountLabel.backgroundColor = UIColor(red: 0.172, green: 0.172, blue: 0.172, alpha: 1.00)
          splitLabel.textColor = UIColor(red: 0.819, green: 0.819, blue: 0.819, alpha: 1.00)
          personNum.textColor = UIColor(red: 0.819, green: 0.819, blue: 0.819, alpha: 1.00)
          tipAmountLabel.textColor = UIColor(red: 0.792, green: 0.792, blue: 0.792, alpha: 1.00)
        step.backgroundColor = UIColor(red: 0.372, green: 0.372, blue: 0.368, alpha: 1.00)
        seg.backgroundColor = UIColor(red: 0.372, green: 0.372, blue: 0.368, alpha: 1.00)

        
  }
    
    func dollar (){
        let bill = Double(billAmountTextField.text!) ?? 0
        let p = Double(step.value)
        let total = bill + (bill*(Double(slider.value)/100))
        totalAmount.text = String(format:"$%.2f", total)
            eachAmount.text = String(format:"$%.2f", total/p)
        
    }
    
    
    
    func pound (){
        let bill = Double(billAmountTextField.text!) ?? 0
        let p = Double(step.value)
        let total = bill + (bill*(Double(slider.value)/100))
        totalAmount.text = String(format:"£%.2f", (total*0.72))
            eachAmount.text = String(format:"£%.2f", ((total/p)*0.72))
        
    }
    
    
    
    
    func euro (){
        let bill = Double(billAmountTextField.text!) ?? 0
        let p = Double(step.value)
        let total = bill + (bill*(Double(slider.value)/100))
        totalAmount.text = String(format:"€%.2f", (total*0.85))
        eachAmount.text = String(format:"€%.2f", ((total/p)*0.85))
       
    }
    
    
    
}



