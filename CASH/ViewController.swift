//
//  ViewController.swift
//  CASH
//
//  Created by stephen weber on 2/25/22.
//
import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Create arrays for naming for labels and images
    var textdata = ["Hotel Suite","Dining Room", "Gym", "Spa Services","Scuba Diving","Overall"]
    var imgdata = ["img0","img1","img2","img3","img4","img5"]
    
    //Creates number of sections
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Creates number of cells for the Collection View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return textdata.count
    }
    
    //Creates cell with label and image
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! customCollectionViewCell
        //Pull data from text array and assigns the label for each cell based on position
        cell.lb.text = textdata[indexPath.row]
        //Pulls data from img array and assigns a picture to each cell based on position
        //Adds check to see if cell was clicked on and changes text label
        switch (indexPath.row){
        case 0:
            if (roomVisited.roomV[0]){
                cell.lb.textColor = UIColor.yellow
            }
            cell.configure(with: UIImage(named: "img0")!)
        case 1:
            if (roomVisited.roomV[1]){
                cell.lb.textColor = UIColor.yellow
            }
            cell.configure(with: UIImage(named: "img1")!)
        case 2:
            if (roomVisited.roomV[2]){
                cell.lb.textColor = UIColor.yellow
            }
            cell.configure(with: UIImage(named: "img2")!)
        case 3:
            if (roomVisited.roomV[3]){
                cell.lb.textColor = UIColor.yellow
            }
            cell.configure(with: UIImage(named: "img3")!)
        case 4:
            if (roomVisited.roomV[4]){
                cell.lb.textColor = UIColor.yellow
            }
            cell.configure(with: UIImage(named: "img4")!)
        case 5:
            if (roomVisited.roomV[5]){
                cell.lb.textColor = UIColor.yellow
            }
            cell.configure(with: UIImage(named: "img5")!)
        default:
            print("Image not found")
        }
        return cell
    }
    	
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //When user clicks on a cell, it directs to the specific viewcontroller and changes the state for roomVisited to change the value to true so that the label color changes
        switch (indexPath.row) {
        case 0:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToBedroom = storyBoard.instantiateViewController(withIdentifier: "bedroomVC" ) as! bedroomViewController
            self.present(goToBedroom, animated: true, completion: nil)
            roomVisited.roomV[0] = true
        case 1:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToDining = storyBoard.instantiateViewController(withIdentifier: "diningVC" ) as! diningViewController
            self.present(goToDining, animated: true, completion: nil)
            roomVisited.roomV[1] = true
        case 2:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToGym = storyBoard.instantiateViewController(withIdentifier: "gymVC" ) as! gymViewController
            self.present(goToGym, animated: true, completion: nil)
            roomVisited.roomV[2] = true
        case 3:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToSpa = storyBoard.instantiateViewController(withIdentifier: "spaVC" ) as! spaViewController
            self.present(goToSpa, animated: true, completion: nil)
            roomVisited.roomV[3] = true
        case 4:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToScuba = storyBoard.instantiateViewController(withIdentifier: "scubaVC" ) as! scubaViewController
            self.present(goToScuba, animated: true, completion: nil)
            roomVisited.roomV[4] = true
        case 5:
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle : nil)
            let goToFeedback = storyBoard.instantiateViewController(withIdentifier: "feedbackVC" ) as! feedbackViewController
            self.present(goToFeedback, animated: true, completion: nil)
            roomVisited.roomV[5] = true
        default:
            print("Invalid click")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

