//
//  SecondViewController.swift
//  Saver
//
//  Created by Coder on 6/19/18.
//  Copyright © 2018 Coder. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    let firstSegueIdentifier : String = "goToFirstSegue"
    
    @IBOutlet weak var firstTextField: UITextField?
    @IBOutlet weak var secondTextField: UITextField?
    @IBOutlet weak var thirdTextField: UITextField?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let saver = DataManeger.saver
        
        firstTextField?.text = saver.firstTextFieldMassage
        secondTextField?.text = saver.secondTextFieldMassage
        thirdTextField?.text = saver.thirdTextFieldMassage
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        
        guard let firstField = firstTextField?.text else {
            print("firstField is empty")
            return
        }
        guard let secondField = secondTextField?.text else {
            print("secondField is empty")
            return
        }
        guard let thirdField = thirdTextField?.text else {
            print("thirdField is empty")
            return
        }
        
        let saver = DataManeger()
        
        saver.save(firsTextField: firstField, secondTextField: secondField, thirdTextField: thirdField)
        
        DataManeger.restore()
        
    }
    

    @IBAction func doneButtonPressed(_ sender: Any) {
        
        
        performSegue(withIdentifier: firstSegueIdentifier, sender: self)
    }
    
}
