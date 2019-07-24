//
//  ViewController.swift
//  IOSDeveloperAssignment
//
//  Created by Imaginglink Inc on 7/24/19.
//  Copyright © 2019 Developer. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var mCV: UICollectionView!
    var ref: DatabaseReference!
    var dataArray = [[String: Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
        mCV.transform = CGAffineTransform.init(rotationAngle: (-(CGFloat)(Double.pi)))
        getRealTimeData()
    }
    
    func getRealTimeData(){
        ref.observe(.value) { [unowned self] (snapshot) in
            
            if let value = snapshot.value as? [[String: Any]]{
                self.dataArray = value
                self.mCV.reloadData()
            }
        }
    }
    
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Identifier", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = UIColor.blue
        cell.setUI(dict: dataArray[indexPath.item])
        cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
}

