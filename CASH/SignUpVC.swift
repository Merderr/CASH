//
//  SignUpVC.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit
import WebKit

class SignUpVC: UIViewController,WKUIDelegate {

   
    
    @IBOutlet var password2: UITextField!
    @IBOutlet var password1: UITextField!
    @IBOutlet var email: UITextField!
    
    
    
    @IBOutlet weak var TheOtherWK: WKWebView!
    @IBOutlet weak var OtherUI: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let html = "<html><body><marquee scrollamount = 13, style='color:rgb(35,255,45);font-family:Sign Painter;font-weight:bold; font-size:300%        '> Special Savings for our Preferred Guests!!..........We Value your opinion as one of our Clients... </marquee></body></html>"
        OtherUI.loadHTMLString(html, baseURL: nil)
       
        TheOtherWK.loadHTMLString(html,baseURL:nil)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToSignIn(_ sender: UIButton) {
    
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let goToSignIn = storyBoard.instantiateViewController(withIdentifier: "signIn" ) as! SignInVC
        self.present(goToSignIn, animated: true, completion: nil)
        
        
        
    }
    
    @IBAction func signInCompletedAction(_ sender: Any) {
        var boolISPOSSIBLE = true
        
        if password1.text == "" {password1.shake()
            boolISPOSSIBLE = false
        }
        if password2.text == "" {password2.shake()
            boolISPOSSIBLE = false
        }
        if email.text == "" {email.shake()
            boolISPOSSIBLE = false
        }
        if boolISPOSSIBLE {
        if password1.text == password2.text && email.text != "" && password1.text != ""{
            
            
            
            print("Saving data???")
            DBHelper.inst.addData(n: email.text!, m: password1.text!)
            
            print("We are good go to feedback")
            GOTO()
        }
        else if password1.text != password2.text {
            
        
            password1.text = ""
            password2.text = ""
            password1.shake()
            password2.shake()
            let alert = UIAlertController(title: "We are Sorry", message: "Your password entries did not Match.", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Okay?", style: .default , handler: {(action)->Void in print("Ok button tapped")})
            alert.addAction(ok)
            self.present(alert, animated:true,completion: nil)
            
        }
        else if password1.text == password2.text && email.text == "" && password1.text != ""{
            email.shake()
            
        }
        }
    }
    func GOTO() {
        
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
         let goToSignUp = storyBoard.instantiateViewController(withIdentifier: "cell" ) as! ViewController
         self.present(goToSignUp, animated: true, completion: nil)
         
    }
    
}

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x:self.center.x - 4.0, y:self.center.y)
        animation.toValue = CGPoint(x:self.center.x + 4.0,y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
