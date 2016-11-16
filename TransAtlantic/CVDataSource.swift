//
//  CVDataSource.swift
//  TransAtlantic
//
//  Created by Alistair Cooper on 11/5/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit

class CVDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private let collectionView: UICollectionView
        
    var hLaurie = Person(name: "Hugh Laurie", image: UIImage(named: "HLaurie")!, isAmerican: false)
    
    var tHiddleston = Person(name: "Tom Hiddleston", image: UIImage(named: "THiddleston")!, isAmerican: false)
    
    var bCranston = Person(name: "Bryan Cranston", image: UIImage(named: "BCranston")!, isAmerican: true)
    
    var hMirren = Person(name: "Helen Mirren", image: UIImage(named: "HMirren")!, isAmerican: false)
    
    var people: [Person]
    
    // MARK: Initializer
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        people = [hLaurie, tHiddleston, bCranston, hMirren]
    }
    
    // MARK: UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCell", for: indexPath) as! PersonCollectionViewCell
        
        let person = people[indexPath.row]
                
        cell.nameLabel.text = person.name
        cell.personImageView.image = person.image
        
        cell.personImageView.layer.borderWidth = 2
        cell.personImageView.layer.borderColor = UIColor.red.cgColor // new in Swift 3
        cell.personImageView.layer.cornerRadius = cell.personImageView.frame.height / 2
        cell.personImageView.clipsToBounds = true
        
        if let guessAmerican = person.guessIsAmerican {
            if guessAmerican {
                cell.usFlagImageView.alpha = 1
            } else {
                cell.ukFlagImageView.alpha = 1
            }
        } else {
            cell.ukFlagImageView.alpha = 0
            cell.usFlagImageView.alpha = 0
        }
        
        return cell
    }
    
    // MARK: UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! PersonCollectionViewCell
        
        var guessIsAmerican: Bool
        
        // change flag
        if cell.ukFlagImageView.alpha == 0 && cell.usFlagImageView.alpha == 0 {
            
            cell.usFlagImageView.alpha = 1
            guessIsAmerican = true
            
        } else if cell.usFlagImageView.alpha == 1 {
            
            cell.usFlagImageView.alpha = 0
            cell.ukFlagImageView.alpha = 1
            guessIsAmerican = false
            
        } else {
            
            cell.ukFlagImageView.alpha = 0
            cell.usFlagImageView.alpha = 1
            guessIsAmerican = true
            
        }
        
        // set property in array
        people[indexPath.row].guessIsAmerican = guessIsAmerican
        
    }

}
