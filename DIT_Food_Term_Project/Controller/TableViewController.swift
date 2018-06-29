//
//  TableViewController.swift
//  DIT_Food_Term_Project
//
//  Created by D7703_22 on 2018. 6. 29..
//  Copyright © 2018년 s22dfg. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    @IBAction func btlink(_ sender: Any) {
        UIApplication.shared.open(URL(String: foodStores[indexPath.row].link)! as URL, options: :, completionHandler: nil)
    }
    
    
    // 데이터 클래스 객체 생성
    var foodStores:[FoodStore] = [
        FoodStore(name: "늘해랑", image: "01", address: "부산광역시 부산진구 양정1동 350-1", tel: "051-863-6997", link: "https://store.naver.com/restaurants/detail?entry=plt&id=19342285&query=%EB%8A%98%ED%95%B4%EB%9E%91"),
        FoodStore(name: "번개반점", image: "02", address: "부산광역시 부산진구 양정동 418-282", tel: "051-852-9969", link: "https://store.naver.com/restaurants/detail?id=16394779"),
        FoodStore(name: "아딸", image: "03", address: "부산광역시 부산진구 양정동 393-18", tel: "051-852-9969", link: "http://addal.kr/"),
        FoodStore(name: "왕짜장", image: "04", address: "부산광역시 부산진구 양정1동 356-22", tel: "051-863-6997", link: "https://store.naver.com/restaurants/detail?id=16447856"),
        FoodStore(name: "토마토 도시락", image: "05", address: "부산광역시 부산진구 양정1동 산19-8", tel: "051-863-6997", link: "http://www.tomatodosirak.co.kr/"),
        FoodStore(name: "홍콩반점", image: "06", address: "부산광역시 부산진구 양정동 353-38", tel: "051-863-6997", link: "http://zzambbong.com/"),
        ]
    var linkSite = ["https://store.naver.com/restaurants/detail?entry=plt&id=19342285&query=%EB%8A%98%ED%95%B4%EB%9E%91"/*늘해랑*/,
                            "https://store.naver.com/restaurants/detail?id=16394779"/*번개반점*/,
                            "http://addal.kr/"/*아딸*/,
                            "https://store.naver.com/restaurants/detail?id=16447856"/*왕짜장*/,
                            "http://www.tomatodosirak.co.kr/"/*토마토*/,
                            "http://zzambbong.com/"/*홍콩반점*/]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = "DIT 배달통"
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return foodStoreNames.count
        return foodStores.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RE", for: indexPath)
            as! FoodStoreTableViewCell
        // Configure the cell...
        
        //        cell.foodStoreCellName.text = foodStoreNames[indexPath.row]
        //        cell.foodStoreCellImage.image = UIImage(named: foodStoreThumbnail[indexPath.row])
        //        cell.foodStoreCellAddress.text = foodStoreAddress[indexPath.row]
        //        cell.foodStoreCellTel.text = foodStoreTel[indexPath.row]
        
       
       /* cell.food Store Cell Name.text = foodStores[indexPath.row].name*/
        cell.foodStoreCellImage.image = UIImage(named: foodStores[indexPath.row].image)
        cell.foodStoreCellAddress.text = foodStores[indexPath.row].address
        cell.foodStoreCellTel.text = foodStores[indexPath.row].tel
        /*Button.foodStoreLink.URL = foodStroes[indexPath.row].link*/
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        print(indexPath.row)
        //        print(foodStoreNames[indexPath.row])
        //        print(foodStoreTel[indexPath.row])
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showDetail" {
            if let indexPath =  tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! DetailViewController
                // 이름 넘기기
                //                destinationController.name = foodStoreNames[indexPath.row]
                //                // 이미지 넘기기
                //                destinationController.cellImage = foodStoreThumbnail[indexPath.row]
                //                destinationController.local1 = foodStoreAddress[indexPath.row]
                //                destinationController.tel1 = foodStoreTel[indexPath.row]
                //                destinationController.menu = foodMenus[indexPath.row]
                //                destinationController.type = foodStoreType[indexPath.row]
                
                destinationController.name = foodStores[indexPath.row].name
                // 이미지 넘기기
                destinationController.cellImage = foodStores[indexPath.row].image
                destinationController.local1 = foodStores[indexPath.row].address
                destinationController.tel1 = foodStores[indexPath.row].tel
                destinationController.menu = foodStores[indexPath.row].menu
                destinationController.type = foodStores[indexPath.row].type
                
            }
        } else if segue.identifier == "totalMapView" {
            let destinationController = segue.destination as! TotalMapViewController
            destinationController.totalFoodStores = foodStores
            // 이미지 넘기기
            //destinationController.cellImage = foodStoreThumbnail[indexPath.row]
            //destinationController.locations = foodStores[IndexPath.row
            //destinationController.tel1 = foodStoreTel[indexPath.row]
            //destinationController.menu = foodMenus[indexPath.row]
            //destinationController.type = foodStoreType
        }
    }
}
