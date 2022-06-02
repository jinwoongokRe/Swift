//
//  TableViewController.swift
//  SimpleTable
//
//  Created by 장진웅 on 2022/06/01.
//  Copyright © 2022 cbycongbab. All rights reserved.
//

import UIKit

var items = ["책 구매", "철수와 약속", "스터디 준비하기"]
var itemsImageFile = ["cart.png", "clock.png", "pencil.png" ]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //The Last : Edit 바 버튼을 만들고 목록을 삭제해보는,,,
         self.navigationItem.leftBarButtonItem = self.editButtonItem
        //오른쪽 화면에는 이미 Add 버튼이 있으니 edit 버튼을 왼쪽에 추가함 >> right를 left로 수정
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() //이 함수는 뷰가 전환될 때 호출되는 함수,
        //리스트가 추가되어 main view로 돌아올 때 호출되며 추가된 내용을 리스트에 보여준다.
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1 // 보통은 테이블 안에 섹션이 한 개이므로 numberOfSections의 리턴값을 1로
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count //섹션당 열의 개수는 Items의 개수이므로 tableView
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    //셀의 내용을 삭제하는 함수.
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //셀 삭제하는 코드 under
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "삭제"
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        //하나의 목록을 선택하여 다른 곳으로 이동하는 소스를 추가하기
        //먼저 변수 만들어서 이동할 변수를 기억후 이동할 목록을 삭제하고 변수에 저장된 내용을 이동한 곳으로 삽입.
        let itemToMove = items[(fromIndexPath as NSIndexPath).row] // 이동할 아이템 저장
        let itemImageToMove = items[(fromIndexPath as NSIndexPath).row]//이동할 이미지 저장
        items.remove(at: (fromIndexPath as NSIndexPath).row) //이동할 아이템 삭제
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row)
        //이동할 이미지 삭제 그리고 그 뒤 이미지들의 인덱스 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row)
        //삭제된 아이템을 이동할 위치로 삽입, 삽입한 아이템들의 인덱스가 재정렬됨.
        itemsImageFile.insert(itemImageToMove, at: (to as NSIndexPath).row)
        //삭제된 아이템의 이미지를 이동할 위치로 삽입함. 또한 삽입한 아이템 이미지 뒤의 이미지들 인덱스 재정렬됨.
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
