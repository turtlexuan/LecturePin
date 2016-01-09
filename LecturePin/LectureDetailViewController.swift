//
//  LectureDetailViewController.swift
//  LecturePin
//
//  Created by 劉仲軒 on 2016/1/9.
//  Copyright © 2016年 劉仲軒. All rights reserved.
//

import UIKit

class LectureDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var lectureImageView: UIImageView!
    @IBOutlet var tableView: UITableView!

    
    var lecture: Lecture!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 載入視圖後，做其他設定
        lectureImageView.image = UIImage(named: lecture.image)
        
        // 設定 tableView 背景顏色
        tableView.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 0.5)

        // 移除多餘的分割線
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // 變更內容列分割線顏色
        tableView.separatorColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
        
        // 啟動 Self Sizing Cells
        tableView.estimatedRowHeight = 48.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        //顯示課程名稱至 Navigation Bar
        title = lecture.name
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! LectureDetailTableViewCell
        
        // 設定 Cell
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = lecture.name
        case 1:
            cell.fieldLabel.text = "Professor"
            cell.valueLabel.text = lecture.professor
        case 2:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = lecture.type
        case 3:
            cell.fieldLabel.text = "Session"
            cell.valueLabel.text = lecture.sessiion
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        // 設定 cell 背景顏色
        cell.backgroundColor = UIColor.clearColor()
        
        
        return cell
        
        
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
