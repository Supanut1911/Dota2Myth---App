//
//  DotaData.swift
//  Dota2Myth App
//
//  Created by Supanut Laddayam on 20/4/2563 BE.
//  Copyright © 2563 Supanut LDM. All rights reserved.
//

import Foundation

struct DotaData: Codable {
    var localized_name: String
    var primary_attr: String
    var attack_type: String
    var img: String
    var legs: Int
    
    var dotaModel: DotaModel {
        return DotaModel(heroName: localized_name,
                         heroType: primary_attr,
                         atkTpye: attack_type,
                         imageHero: img,
                         legs: legs)
    }
}

struct DotaModel: Codable {
    var heroName: String
    var heroType: String
    var atkTpye: String
    var imageHero: String
    var legs: Int
}
