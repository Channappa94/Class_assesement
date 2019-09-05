//
//  ViewController.swift
//  Class_assesement
//
//  Created by IMCS2 on 9/4/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let m = FetchingViewController()
    let fetch = ModelView()
    var nameOfSinger = [String]()
    var dateOfRelease = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameOfSinger.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.leftLabel.text = nameOfSinger[indexPath.row]
        cell.rightLabel.text = dateOfRelease[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registgerCell()
        allData()
    }
    
    func allData(){
        FetchingViewController.fetchingData { (names : ModelView) in
            for count in 0..<names.namesOfSinger.count{
                self.nameOfSinger.append(names.namesOfSinger[count])
            }
            for counts in 0..<names.datesOfSinger.count{
                self.dateOfRelease.append(names.datesOfSinger[counts])
            }
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    func registgerCell() {
        self.tableView?.register(UINib(nibName:"TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
    }
}

