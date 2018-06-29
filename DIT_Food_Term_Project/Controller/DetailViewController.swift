//
//  DetailViewController.swift
//  DIT_Food_Term_Project
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate{
    
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    
    var cellImage: String = ""
    var name: String = ""
    var local1: String = ""
    var tel1: String = ""
    var menu: String = ""
    var type: String = ""
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "주소 : " + local1
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "전화번호 : " + tel1
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
            cell.textLabel?.text = "메뉴 : " + menu
            return cell
        default :
            let cell = tableView.dequeueReusableCell(withIdentifier: "mapCell", for: indexPath) as! FoodStoreTableViewCell
            cell.configure(location: local1)
            return cell
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        cellImageView.image = UIImage(named: cellImage)
        self.title = name
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
