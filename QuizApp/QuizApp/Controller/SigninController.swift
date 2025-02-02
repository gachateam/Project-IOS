//
//  SigninController.swift
//  QuizApp
//
//  Created by Nguyen Tien on 06/06/2021.
//

import UIKit
import FirebaseAuth

class SigninController: UIViewController {
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    //MARK: - properties
   
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func loginBtn(_ sender: UIButton) {
        if email.text?.isEmpty == true {
            print("Please enter email")
            return
        }
        if password.text?.isEmpty == true {
            print("Please enter password")
            return
        }
        login()
        print("login success")
    }
    
    func login(){
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (result, error) in
            if let error = error {
                print("Error: ", error.localizedDescription)
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "home")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
