//
//  ViewController.swift
//  Class_assesement
//
//  Created by IMCS2 on 9/4/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    
    var copier = FetchingViewController()
    

 
    
    
    
    @IBOutlet weak var tableView: UITableView!
    let m = FetchingViewController()
    var namesOfSinger = [String]()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesOfSinger.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell

        
        cell.leftLabel.text = namesOfSinger[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        registgerCell()
        
        FetchingViewController.fetchingData { (names : [String]) in
            for i in 0...
            
            
            
            
            
            
            
            
            
        
        
            DispatchQueue.main.async {
             self.tableView?.reloadData()
            }
        
        }
        
    }
    
    
    func registgerCell() {
        self.tableView?.register(UINib(nibName:"TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

