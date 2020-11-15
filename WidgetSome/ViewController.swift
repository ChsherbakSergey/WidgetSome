//
//  ViewController.swift
//  WidgetSome
//
//  Created by Sergey on 11/15/20.
//

import WidgetKit
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        textField.becomeFirstResponder()
    }
    
    func setUI() {
        doneButtonOutlet.layer.cornerRadius = 15
    }

    @IBAction func doneButtonIsTapped(_ sender: Any) {
        textField.resignFirstResponder()
        
        let userDefaults = UserDefaults(suiteName: "group.widget-cache")
        
        guard let text = textField.text, !text.isEmpty else {
            return
        }
        
        userDefaults?.setValue(text, forKey: "text")
        WidgetCenter.shared.reloadAllTimelines()
    }
    
}

