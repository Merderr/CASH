//
//  SignInVC.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit
 



class SignInVC: UIViewController  {

   
    @IBOutlet weak var checkbox: UIButton!
    var Pass : String = ""
    var EM   : String = ""
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet var email: UITextField!
//    var E : [String]
//    var P : [String]
    let checkboxButton = CheckBox(frame:CGRect(x:57,y:375,width:40,height:40))
   
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
         
        print("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target:self,action: #selector(didTapCheckBox))
        checkboxButton.addGestureRecognizer(gesture)
        view.addSubview(checkboxButton)
       
        let client = DBHelper.inst.getData()
         var E  : [String] = []
          var P  : [String] = []
        
       
        for d in client {
            if d != nil {
            E.append(d.email!)
            P.append(d.password!)
            
            }
        }
        let num = E.count
        print(E.count)
        
        print(E[num - 1])
        print(P[num - 1])
        print("Finished to end page")
        Pass = String(P[num - 1])
        EM = String(E[num - 1 ])
        //password.text = Pass
     //   email.text = EM
        
       
        
    }
    
    
    @objc func didTapCheckBox() {
        checkboxButton.toggle()
        if checkboxButton.isChecked == true {
             
            password.text = Pass
            email.text = EM
        }
        else{
            password.text = ""
            email.text = ""
        }
    }
    
    @IBAction func goToSignUp(_ sender: UIButton) {
       
       
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
        let goToSignUp = storyBoard.instantiateViewController(withIdentifier: "signUp" ) as! SignUpVC
        self.present(goToSignUp, animated: true, completion: nil)
      
    }
    
    @IBAction func emailSave(_ sender: Any) {
         
        
    }
    @IBAction func signingInAction(_ sender: UIButton) {
        
         let client = DBHelper.inst.getData()
          var E  : [String] = []
           var P  : [String] = []
         var boolISPOSSIBLE = true
        if email.text == "" {email.shake()
            boolISPOSSIBLE = false
        }
        if password.text == "" {password.shake()
            boolISPOSSIBLE = false
        }
         for d in client {
             if d != nil {
             E.append(d.email!)
             P.append(d.password!)
             
             }
         }
        if boolISPOSSIBLE {
        if P.contains(password.text ?? "this is not possible") && E.contains(email.text ?? "this is a thousand percent chance of ") {
            GOTO()
        }
        }
    }
    
    
    func GOTO() {
        
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
         let goToSignUp = storyBoard.instantiateViewController(withIdentifier: "cell" ) as! ViewController
         self.present(goToSignUp, animated: true, completion: nil)
         
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
