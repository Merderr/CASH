//
//  SignInVC.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let goToSignUp = storyBoard.instantiateViewController(withIdentifier: "signUp" ) as! SignUpVC
        self.present(goToSignUp, animated: true, completion: nil)
        
        
    }
    
    @IBAction func signingInAction(_ sender: UIButton) {
        
        
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
