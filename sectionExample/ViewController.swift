//
//  ViewController.swift
//  sectionExample
//
//  Created by DongMin Hwang on 2023/01/25.
//

import UIKit

class ViewController: UIViewController {
 
    
    var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()

        layout.scrollDirection = .vertical
//        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20, height: 200)

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return collectionView
    }()
    
    //var collectionView : UICollectionView!
    
    let ID_DATE_CELL = "DatePickerCell"
    let ID_HOUR_CELL = "HourePickerCell"
    let ID_MIN_CELL = "MinutePickerCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(collectionView)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        
        self.collectionView.register(DatePickerCell.self, forCellWithReuseIdentifier: ID_DATE_CELL)
        self.collectionView.register(HourPickerCell.self, forCellWithReuseIdentifier: ID_HOUR_CELL)
        self.collectionView.register(MinutePickerCell.self, forCellWithReuseIdentifier: ID_MIN_CELL)
        
        self.collectionView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
                    collectionView.heightAnchor.constraint(equalToConstant: 180),
                    collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                    collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                    collectionView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300)
                ]
                
                NSLayoutConstraint.activate(constraints)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
}

extension ViewController :  UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if indexPath.section == 0 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID_DATE_CELL, for: indexPath) as! DatePickerCell
        } else if indexPath.section == 1 {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID_HOUR_CELL, for: indexPath) as! HourPickerCell
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: ID_MIN_CELL, for: indexPath) as! MinutePickerCell
        }

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/3)
    }

    
}

