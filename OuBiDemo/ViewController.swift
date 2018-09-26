//
//  ViewController.swift
//  OuBiDemo
//
//  Created by chenwei on 2018/9/19.
//  Copyright © 2018年 chenwei. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var mainTableView:UITableView = UITableView(frame: .zero, style: .plain)
    let dataArr = [["东山街道","哈哈"],
                   ["的还是电视电话"],
                   ["的还是电视电话"],
                   ["的还是电视电话"],
                   ["多岁的","颠三倒四","都是单独所多岁的"],
                   ["电视电话"],
                   ["的还是电视电话"],
                   ["东山街道","都是单独所多岁的","哈哈"],
                   ["的还是电视电话"],
                   ["东山街道","哈哈"],
                   ["的还是电视电话"],
                   ["的还是电视电话","啊哦"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setSubView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: 设置UI子视图
extension ViewController{
    fileprivate func setSubView(){
        mainTableView.backgroundColor = UIColor.clear
        view.addSubview(mainTableView)
        mainTableView.separatorStyle = .none
        mainTableView.estimatedRowHeight = 44
        mainTableView.rowHeight = UITableViewAutomaticDimension
        mainTableView.snp.makeConstraints({ (make) in
            make.left.right.top.equalTo(0)
            make.bottom.equalTo(-40)
        })

        mainTableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")

        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.separatorStyle = .none
//        mainTableView.bounces = false
//        mainTableView.showsVerticalScrollIndicator = false
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return dataArr.count
    }


//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return tableView.fd_heightForCell(withIdentifier: "CustomCell", configuration: { (cell) in
//            let tmpCell = cell as! CustomCell
//            tmpCell.updateCell(array: self.dataArr[indexPath.row], isLeft: (indexPath.row%2 == 0))
//        })
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell : CustomCell = tableView.dequeueReusableCell(withIdentifier:"CustomCell" , for: indexPath) as! CustomCell
        if (indexPath.row%2 == 0) {
            cell.contentView.backgroundColor = UIColor.yellow
        }else {
            cell.contentView.backgroundColor = UIColor.clear
        }
        cell.updateCell(array: dataArr[indexPath.row], isLeft: (indexPath.row%2 == 0))

        return cell

    }
}

