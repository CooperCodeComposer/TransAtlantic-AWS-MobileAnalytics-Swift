//
//  ViewController.swift
//  TransAtlantic
//
//  Created by Alistair Cooper on 11/5/16.
//  Copyright © 2016 Alistair Cooper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var score: Int = 0
    
    // reference to DataSource (model layer)
    lazy var dataSource: CVDataSource = {
        return CVDataSource(collectionView: self.collectionView)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }
    
    func displayScore() {
        
        let ac = UIAlertController(title: "SCORE", message: "You Answered \(score) Correctly!", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        present(ac, animated: true, completion: nil)
    }
    
    func checkAnswers() {
        
        // reset score
        score = 0
        
        for person in dataSource.people {
            
            guard let guessIsAmerican = person.guessIsAmerican else { return }
            
            if person.isAmerican && guessIsAmerican {
                score += 1
            }
            
            else if !person.isAmerican && !guessIsAmerican {
                score += 1
            }
        }
    }

    @IBAction func submit(_ sender: UIButton) {
        
        checkAnswers()
        displayScore()
    }
}


