//
//  FetchingViewController.swift
//  Class_assesement
//
//  Created by IMCS2 on 9/4/19.
//  Copyright © 2019 com.phani. All rights reserved.
//

import UIKit

class FetchingViewController: UIViewController {

static   var array: [String] = []
static   var date: [String] = []


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
static func fetchingData(completionHandler : @escaping ([String]) -> ()) {
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json")
        let task = URLSession.shared.dataTask(with: url!){ ( data, response, error) in
            if error ==  nil{
                if let unwrappedData = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
                        let feed = jsonResult?["feed"] as? NSDictionary
                        let results = feed?["results"] as? NSArray
                        
                            if let count = results?.count{
                                for n in 0...count-1{
                                    let insideITem = results?[n] as! NSDictionary
                                    self.array.append(insideITem["artistName"] as! String)
                                    let blogTitle = results?[n] as! NSDictionary
                                    self.array.append(blogTitle["releaseDate"] as! String)
                                    print(array)
                                }
                                
                                completionHandler(array)
                        }
                    }catch{
                        print("Error")
                    }
                    
                }
            }
            
        }
        task.resume()
        
    }

}
