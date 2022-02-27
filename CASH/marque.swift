//
//  marque.swift
//  CASH
//
//  Created by stephen weber on 2/26/22.
//

import UIKit
import WebKit
class marque: UIViewController, WKUIDelegate {

    @IBOutlet weak var webM: WKWebView!
  //  let webView = WKWebView()
   // @IBOutlet var webMarquee: WKWebView!
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
     
        
       let html = "<html><body><marquee scrollamount = 20, style='color:rgb(35,255,45);font-weight:bold; font-size:1000%        '> Special Savings for our Preferred Guests!!..........We Value your opinion as one of our clients... </marquee></body></html>"
        webM.loadHTMLString(html, baseURL: nil)
       // webView.loadHTMLString(html, baseURL: nil)
    }
    


}
