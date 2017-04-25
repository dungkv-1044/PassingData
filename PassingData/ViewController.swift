//
//  ViewController.swift
//  PassingData
//
//  Created by Khuat Van Dung on 4/25/17.
//  Copyright © 2017 Khuat Van Dung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var text: String?
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? DestinationViewController {
            let data = textField.text
            destinationVC.text = data
        }
    }
    @IBAction func passingDataWithoutSegue(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil) // Name of storyboard....
        let destinationVC = storyboard.instantiateViewController(withIdentifier: "DestinationViewController") as! DestinationViewController
        destinationVC.text = textField.text ?? "Nil"
        self.present(destinationVC, animated: true, completion: nil)
    }
    
    @IBAction func unwind(for unwindSegue : UIStoryboardSegue) {
        if let origin = unwindSegue.source as? DestinationViewController {
            let text = origin.text
            textField.text = text
        }
    }

}

