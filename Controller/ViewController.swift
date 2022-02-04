//
//  ViewController.swift
//  FinalTest
//
//  Created by english on 2021-12-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let listViewController=segue.destination as! ListViewController
        listViewController.loggedUserName=txtName.text!
    }
    
    

}

