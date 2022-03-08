//
//  SignInVC.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit
 



class SignInVC: UIViewController  {

    @IBOutlet weak var loginLabel: UIButton!
    
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
        checkboxButton.isChecked = true
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
        if E.count != 0 {
        print(E[num - 1])
        print(P[num - 1])
        print("Finished to end page")
        Pass = String(P[num - 1])
        EM = String(E[num - 1 ])
            email.text=EM
            password.text=Pass
    }
        else
        {Pass = ""
            EM = ""
            checkboxButton.toggle()
        }
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
            else {
                print("checked records and no sign up with that account")
                let alert = UIAlertController(title: "We are Sorry", message: "We checked our records and found no client with those Credentials", preferredStyle: .alert)
                let ok = UIAlertAction(title: "Notification", style: .default , handler: {(action)->Void in print("Ok button tapped")})
                alert.addAction(ok)
                self.present(alert, animated:true,completion: nil)
            }
        }
    }
    
    
    func GOTO() {
        keyChain()
         let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
         let goToSignUp = storyBoard.instantiateViewController(withIdentifier: "cell" ) as! ViewController
         self.present(goToSignUp, animated: true, completion: nil)
         
    }
    
    
    
    func keyChain(){
        // named function arriving from GOTO to show password with
        //proper keychain function
        SaveData()
            // saving password and id to keyChain
    }
    
    
    func SaveData() {
        // still keychain subroutines
        // this again is from original GOTO function
        // which saved everything in core data
        // a method under keychain saving of password
        
        
        
        
        
        let PP = password.text
        let UU = email.text
        // if values are here they have already been checked for non nil
        if PP == nil || UU == nil {return}
       //set Attributes
       let att : [String : Any] = [kSecClass as String: kSecClassGenericPassword,
                                   kSecAttrAccount as String : UU!,
                                   kSecValueData as String : PP!.data(using: .utf8)!
       ]
       
       // added data correctly check
       
       if SecItemAdd(att as CFDictionary, nil) == noErr {
           print("data saved successfully")
       }
       else {
           print("UserName Taken")
       }
       
       
   }
    
    
    
    func getData() {
        
        //set Query
        // Error checked leftand right function is here through GOTO fucntion
        // This is just a helper routine to show saving with Keychain
        // It is not called direcly
        // to use it needs just username (email.text outlet)
        // of last login save which is a keychain to the password
        
        
        //note forced unwraps are safe as this function can be called only // after GOTO which is a firm saved tested
        let q : [String :Any] = [kSecClass as String :  kSecClassGenericPassword,
                                 kSecAttrAccount as String: email.text!,
                                 kSecReturnAttributes as String : true,
                                 kSecReturnData as String : true]
        
        var res : CFTypeRef?
        
       if SecItemCopyMatching(q as CFDictionary, &res) == noErr {
           
           if let item = res as? [String : Any],
            let uid = item[kSecAttrAccount as String] as? String,
            let passwordK = item [ kSecValueData as String] as? Data,
            let passWord = String(data : passwordK, encoding: .utf8)
            
           { password.text = passWord
               email.text = email.text
               //this function can get email from core data which can
               // hold this data
               
//                print("id is \(uid) and the password is \(passWord) .uid== \(uid)   .passw= \(password)")
//
//               for (Kind,Mum) in item {print(Kind,Mum)
//
//               }
            }
            else {
                print("no data found")
            }
        }
        
    }//
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

   
}
