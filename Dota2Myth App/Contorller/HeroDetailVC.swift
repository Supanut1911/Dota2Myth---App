//
//  HeroDetail.swift
//  Dota2Myth App
//
//  Created by Supanut Laddayam on 21/4/2563 BE.
//  Copyright © 2563 Supanut LDM. All rights reserved.
//

import UIKit
import Kingfisher

class HeroDetailVC: UIViewController {
 
    var hero: DotaData?


    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var attrLabel: UILabel!
    @IBOutlet weak var atkTypeLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()
        navigationItem.title = hero?.localized_name
    }
    
    private func setupUI() {
        let urlString = "https://api.opendota.com"+(hero?.img)!
        if let url = URL(string: urlString) {
              self.heroImageView.kf.setImage(with: url)
        }
        
        
      
        self.heroNameLabel.text = hero?.localized_name
        self.attrLabel.text = hero?.primary_attr
        self.atkTypeLabel.text = hero?.attack_type
        
        self.legsLabel.text = String((hero?.legs)!)
    }

}
