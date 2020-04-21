//
//  ViewController.swift
//  Dota2Myth App
//
//  Created by Supanut Laddayam on 20/4/2563 BE.
//  Copyright © 2563 Supanut LDM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dotaTableView: UITableView!
    
    let dotaManager = DotaManager()
    var dotaData = [DotaData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchDotaData()
    }

    func fetchDotaData() {
        dotaManager.fetchDotaInformation { (result) in
            switch result {
            case .success(let model):
                self.dotaData = model
                print(self.dotaData[0].localized_name)
                self.dotaTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    
    }
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dotaData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroCell", for: indexPath)
        cell.textLabel?.text = dotaData[indexPath.row].localized_name
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToHeroDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? HeroDetailVC {
            destination.hero = dotaData[dotaTableView.indexPathForSelectedRow!.row]
        }
    }
}

