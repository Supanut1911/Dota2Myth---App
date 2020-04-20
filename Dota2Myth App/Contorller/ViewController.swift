//
//  ViewController.swift
//  Dota2Myth App
//
//  Created by Supanut Laddayam on 20/4/2563 BE.
//  Copyright © 2563 Supanut LDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dotaManager = DotaManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dotaManager.fetchDotaInformation()
    }


}

