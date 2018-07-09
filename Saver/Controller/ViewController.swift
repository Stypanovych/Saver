//
//  ViewController.swift
//  Saver
//
//  Created by Coder on 6/19/18.
//  Copyright © 2018 Coder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let secondSegueIdentifier : String = "goToSecondSegue"
    
    @IBOutlet weak var firstLabel: UILabel?
    @IBOutlet weak var secondLabel: UILabel?
    @IBOutlet weak var thirdLabel: UILabel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataManeger.restore()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let saver = DataManeger.saver
        
        firstLabel?.text = saver.firstTextFieldMassage
        secondLabel?.text = saver.secondTextFieldMassage
        thirdLabel?.text = saver.thirdTextFieldMassage
        print("saver.firstTextFieldMassege \(String(describing: saver.firstTextFieldMassage))")
        print(secondLabel?.text)
    }
    


    @IBAction func editButtonPressed(_ sender: Any) {
        
        
        
        performSegue(withIdentifier: secondSegueIdentifier, sender: self)
        
    }
    

}

