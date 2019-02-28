//
//  ViewController.swift
//  AlamoFireIntroduction
//
//  Created by Eric Castronovo on 2/24/19.
//  Copyright © 2019 Runner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    private let networkingClient = NetworkingClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func executeRequest(_ sender: Any) {
        
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
    }
    
    @IBAction func executeSpecificRequest(_ sender: Any) {
        guard let urlToExecute = URL(string: "https://jsonplaceholder.typicode.com/posts" + "/" + textField.text!) else {
            return
        }
        networkingClient.execute(urlToExecute) { (json, error) in
            if let error = error {
                self.textView.text = error.localizedDescription
            } else if let json = json {
                self.textView.text = json.description
            }
        }
        
    }
}

