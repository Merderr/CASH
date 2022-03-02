//
//  ViewController.swift
//  CASH
//
//  Created by stephen weber on 2/25/22.
//
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    var textdata = ["Hotel Suite","Dining Room", "Gym", "Spa Services","Scuba Diving","Overall"]
    var imgdata = ["img","img","img","img","img"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textdata.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCollectionViewCell
        cell.lb.text = textdata[indexPath.row]
        cell.configure(with: UIImage(named: "img")!)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToBedroom = storyBoard.instantiateViewController(withIdentifier: "bedroomVC" ) as! bedroomViewController
            self.present(goToBedroom, animated: true, completion: nil)
        case 1:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToDining = storyBoard.instantiateViewController(withIdentifier: "diningVC" ) as! diningViewController
            self.present(goToDining, animated: true, completion: nil)
        case 2:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToGym = storyBoard.instantiateViewController(withIdentifier: "gymVC" ) as! gymViewController
            self.present(goToGym, animated: true, completion: nil)
        case 3:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToSpa = storyBoard.instantiateViewController(withIdentifier: "spaVC" ) as! spaViewController
            self.present(goToSpa, animated: true, completion: nil)
        case 4:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToScuba = storyBoard.instantiateViewController(withIdentifier: "scubaVC" ) as! scubaViewController
            self.present(goToScuba, animated: true, completion: nil)
        case 5:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToFeedback = storyBoard.instantiateViewController(withIdentifier: "feedbackVC" ) as! feedbackViewController
            self.present(goToFeedback, animated: true, completion: nil)
        default:
            print("oops")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    

}

