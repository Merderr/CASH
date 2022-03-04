//
//  SignUpVC.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var password2: UITextField!
    @IBOutlet var password1: UITextField!
    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToSignIn(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let goToSignIn = storyBoard.instantiateViewController(withIdentifier: "signIn" ) as! SignInVC
        self.present(goToSignIn, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func signInCompletedAction(_ sender: Any) {
        if password1.text == password2.text && email.text != "" {
            
            
            print("Saving data???")
            DBHelper.inst.addData(n: email.text!, m: password1.text!)
            
            print("We are good go to feedback")
        }
        else
        { if password1.text != password2.text {
            
        
            password1.text = ""
            password2.text = ""
            
            let alert = UIAlertController(title: "We are Sorry", message: "Your password entries did not Match.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Okay?", style: .default , handler: {(action)->Void in print("Ok button tapped")})
            alert.addAction(ok)
            self.present(alert, animated:true,completion: nil)
            
        }
        }
        //link to feedback page
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
