//
//  ViewController.swift
//  CarModel
//
//  Created by qianfeng on 16/9/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // 数据源
    var dataArr:[AnyObject] = NSMutableArray() as [AnyObject]
    var page:NSInteger = 1
    var flag:Bool = false
    
    lazy var tableView:UITableView = {
        let tableView = UITableView.init(frame: CGRectMake(0, 0, S_W, S_H))
        tableView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(tableView)
        tableView.registerNib(UINib.init(nibName: "VideoCell", bundle: nil), forCellReuseIdentifier: "VideoCell")
        tableView.registerNib(UINib.init(nibName: "BothCell", bundle: nil), forCellReuseIdentifier: "BothCell")
        tableView.registerNib(UINib.init(nibName: "ArticleCell", bundle: nil), forCellReuseIdentifier: "ArticleCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.page = 1
            self.flag = true
            self.loadData()
        })
        tableView.footer = MJRefreshAutoFooter.init(refreshingBlock: {
            self.page += 1
            self.flag = false
            self.loadData()
        })
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        self.loadData()
    }
    func loadData() -> Void {
        CarModel.requestData(Page: self.page) { (array, error) in
            if error == nil{
                if self.flag == true{
                    self.dataArr.removeAll()
                }
                for model in array!{
                    self.dataArr.append(model)
                }
                print("count = \(self.dataArr.count)")
                self.tableView.reloadData()
            }
            self.tableView.header.endRefreshing()
            self.tableView.footer.endRefreshing()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let model = self.dataArr[indexPath.row] as! CarModel
        //        print(model.cover!)
        if String(model.type!) == "1"{
            let cell = tableView.dequeueReusableCellWithIdentifier("BothCell", forIndexPath: indexPath) as! BothCell
            cell.customWith(model)
            return cell
        }else if String(model.type!) == "2"{
            let cell = tableView.dequeueReusableCellWithIdentifier("ArticleCell", forIndexPath: indexPath) as! ArticleCell
            cell.customWith(model)
            return cell
            
        }else{
            let cell = tableView.dequeueReusableCellWithIdentifier("VideoCell", forIndexPath: indexPath) as! VideoCell
            cell.customWith(model)
            return cell
            
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180
    }
}













