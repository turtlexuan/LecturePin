//
//  LectureTableViewController.swift
//  LecturePin
//
//  Created by 劉仲軒 on 2016/1/9.
//  Copyright © 2016年 劉仲軒. All rights reserved.
//

import UIKit

class LectureTableViewController: UITableViewController {

    var lectures:[Lecture] = [
        Lecture(name: "經濟學原理", type: "必修", professor: "林明仁", sessiion: "100-1 & 100-2", image: "經濟學原理.jpeg"),
        Lecture(name: "個體經濟學", type: "必修", professor: "黃貞穎", sessiion: "101-1 & 101-2", image: "個體經濟學.jpg"),
        Lecture(name: "總體經濟學", type: "必修", professor: "毛慶生", sessiion: "101-1 & 101-2", image: "總體經濟學.jpg"),
        Lecture(name: "統計學", type: "必修", professor: "林惠玲", sessiion: "101-1 & 101-2", image: "統計學.jpg"),
        Lecture(name: "國際關係", type: "選修", professor: "明居正", sessiion: "101-1 & 101-2", image: "國際關係.jpg"),
        Lecture(name: "國際公法", type: "選修", professor: "蔡季廷", sessiion: "101-1 & 101-2", image: "國際公法.jpg"),
        Lecture(name: "視覺文化與紀錄片拍攝", type: "通識", professor: "鍾宜杰", sessiion: "102 Summer", image: "視覺文化與紀錄片拍攝.jpg"),
        Lecture(name: "財政學", type: "選修", professor: "林全", sessiion: "102-1", image: "財政學.jpg"),
        Lecture(name: "貨幣銀行學", type: "選修", professor: "李怡庭", sessiion: "102-1", image: "貨幣銀行學.jpg"),
        Lecture(name: "視聽資料製作", type: "選修", professor: "朱則剛", sessiion: "102-1", image: "視聽資料製作.jpg"),
        Lecture(name: "媒體素養", type: "選修", professor: "陳炳宏", sessiion: "102-1", image: "媒體素養.jpg"),
        Lecture(name: "投資學", type: "選修", professor: "陳彥行", sessiion: "103-1", image: "投資學.jpg"),
        Lecture(name: "新聞攝影", type: "選修", professor: "楊光昇", sessiion: "103-1", image: "新聞攝影.jpg"),
        Lecture(name: "賽局理論與策略思考", type: "選修", professor: "馮勃翰", sessiion: "104-1", image: "賽局理論與策略思考.jpg"),
        Lecture(name: "程式語言", type: "選修", professor: "穆信成", sessiion: "104-1", image: "程式語言.jpg"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 將返回按鈕標題清空
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        
        
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableViewAutomaticDimension

        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lectures.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! LectureTableViewCell
        
        cell.nameLabel.text = lectures[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: lectures[indexPath.row].image)
        cell.typeLabel.text = lectures[indexPath.row].type
        cell.professorLabel.text = lectures[indexPath.row].professor
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // 從 data source 刪除列
            lectures.removeAtIndex(indexPath.row)
        }
        
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        // 社群分享按鈕
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "我這學期上了" + self.lectures[indexPath.row].name
            if let imageToShare = UIImage(named: self.lectures[indexPath.row].image){
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
        })
        
        // 刪除按鈕
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler: { (action, indexPath) -> Void in
            
            // 從data source刪除列
            self.lectures.removeAtIndex(indexPath.row)
            
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        // 設定按鈕顏色
        shareAction.backgroundColor = UIColor(red: 99.0/255.0, green: 167.0/255.0, blue: 215.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLectureDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! LectureDetailViewController
                destinationController.lecture = lectures[indexPath.row]
                
            }
        }
    }


}
