//
//  ViewController.swift
//  Log In
//
//  Created by Nick Natali on 1/1/17.
//  Copyright © 2017 Make It Appen. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    var signupMode = true
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    
    func createAlert(title: String, message: String) {

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title:"OK", style: .default, handler: { (action) in
            
            self.dismiss(animated: true, completion: nil)
            
            
        }))
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    @IBAction func signupOrLogin(_ sender: Any) {
        
        if emailTextField.text == "" || passwordTextField.text == "" {
            
            createAlert(title: "Error in form", message: "Please enter an email and a password")
            
                   } else {
            
            if signupMode {
                //Sign Up 
                
                let user = PFUser()
                
                user.username = emailTextField.text
                
                user.email = emailTextField.text
                
                user.password = passwordTextField.text
                
                user.signUpInBackground({ (success, error) in
                
                    if error != nil {
                        
                        print("error")
                        
                        self.createAlert(title: "Error in form", message: "Parse error")
                        
                    } else {
                        
                        print("user signed up")
                        
                        
                    }
                
                
                
                })
                
                
                
                
            }
            
            
        }
        
    }
  
    
    @IBOutlet var signupOrLogin: UIButton!
    
    
    @IBAction func changeSignupMode(_ sender: Any) {
        
        if signupMode {
            
            //Change to Log In Mode
        
    signupOrLogin.setTitle("Log In", for: [])
            
    changeSignupModeButton.setTitle("Sign Up", for: [])
        
    messageLabel.text = "Don't have an account?"
            
    signupMode = false
        
        } else {
            
            //Change to signup mode
            
    signupOrLogin.setTitle("Sign Up", for: [])
            
    changeSignupModeButton.setTitle("Log In", for: [])
            
    messageLabel.text = "Already have an account?"
            
    signupMode = true
            
        }
       
        
    }
    
    @IBOutlet var changeSignupModeButton: UIButton!
    
    @IBOutlet var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

