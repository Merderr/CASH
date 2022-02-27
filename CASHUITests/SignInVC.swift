//
//  SignInVC.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit
import WebKit


class SignInVC: UIViewController ,WKUIDelegate {

    @IBOutlet weak var webV: UIWebView!
  
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let html = "<html><body><marquee scrollamount = 13, style='color:rgb(35,255,45);font-family:Sign Painter;font-weight:bold; font-size:300%        '> Special Savings for our Preferred Guests!!..........We Value your opinion as one of our Clients... </marquee></body></html>"
        webV.loadHTMLString(html, baseURL: nil)
       // webView.loadHTMLString(html, baseURL: nil)
        
        
        
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
