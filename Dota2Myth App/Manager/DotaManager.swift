//
//  DotaManager.swift
//  Dota2Myth App
//
//  Created by Supanut Laddayam on 20/4/2563 BE.
//  Copyright © 2563 Supanut LDM. All rights reserved.
//

import Foundation
import Alamofire

struct DotaManager {
    let path = "https://api.opendota.com/api/heroStats"
    
//    func fetchDotaInformation(completion: @escaping (Result<DotaModel,Error>))->Void {
    func fetchDotaInformation() {
        let urlString = String(path)
        
        AF.request(urlString).responseDecodable(of: [DotaData].self, queue: .main, decoder: JSONDecoder()) { (response) in
            switch response.result {
            case .success(let dotaData):
                print(dotaData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
