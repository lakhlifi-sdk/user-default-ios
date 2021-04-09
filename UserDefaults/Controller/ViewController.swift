//
//  ViewController.swift
//  UserDefaults
//
//  Created by Lakhlifi Essaddiq on 4/6/21.
//

import UIKit
import KeychainSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var username : UITextField!
    @IBOutlet weak var password : UITextField!
    @IBOutlet weak var rm_switch: UISwitch!
    var message = "message"
    
    
    
    var userDefault = UserDefaults.standard
    let keychain = KeychainSwift()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rm_switch.isOn = false
        
        
        //keyChane :
//        
//        guard let name = keychain.get("username") else {
//            return
//        }
//        print(name)
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        
        if(segue.identifier == "segue"){
            let destionationController = segue.destination as! HomeViewController
            destionationController.message = self.message
        }
        
    }

    @IBAction func login_btn(_ sender: Any) {
        
        guard let uname = username.text , let passwd = password.text else {
            return
        }
        
        keychain.set(uname , forKey: "username")
        keychain.set(passwd, forKey: "password")
        
        if(username.text?.isEmpty == true && password.text?.isEmpty == true){
            let alert = UIAlertController(title: "Error", message: "login or password are empty", preferredStyle: .alert)
            // Create actions
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }else if ( username.text == "admin" && password.text == "admin"){
            if(rm_switch.isOn == true){
                userDefault.setValue("true", forKey: "switch")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Home")
                navigationController?.pushViewController(vc,animated: true)
            }else{
                userDefault.setValue("false", forKey: "switch")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "Home")
                navigationController?.pushViewController(vc,animated: true)
            }
        }else{
            let alert = UIAlertController(title: "Error", message: "login or passwor incorrect", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
        userDefault.synchronize()
    }
    
}

