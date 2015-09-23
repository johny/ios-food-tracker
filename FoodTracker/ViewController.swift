//
//  ViewController.swift
//  FoodTracker
//
//  Created by Jan Kraus on 23/09/15.
//  Copyright © 2015 Jan Kraus Stanko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
  
  // MARK: Properites
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var mealNameLabel: UILabel!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    // Handle the text field’s user input through delegate callbacks.
    nameTextField.delegate = self
    
  }
  
  
  // MARK: UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    // hide the keyboard
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    mealNameLabel.text = textField.text
  }

  // MARK: Actions
  @IBAction func setLabelText(sender: UIButton) {
    mealNameLabel.text = "Default label"
  }
  
  

}

