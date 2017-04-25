//
//  DestinationViewController.swift
//  PassingData
//
//  Created by Khuat Van Dung on 4/25/17.
//  Copyright © 2017 Khuat Van Dung. All rights reserved.
//

import UIKit

protocol Delegate : NSObjectProtocol {
    func doSomething(with data: String)
}

class DestinationViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    var text: String?
    weak var delegate : Delegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dismissView(_ sender: Any) {
        passDataBackwards()
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        text =  textField.text ?? ""
    }
    
    func passDataBackwards() {
        delegate?.doSomething(with: "Passing data with delegate.")
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
