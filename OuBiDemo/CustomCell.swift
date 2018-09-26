//
//  CustomCell.swift
//  OuBiDemo
//
//  Created by chenwei on 2018/9/19.
//  Copyright © 2018年 chenwei. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    var lineImageView = UIImageView()
    var circleImageView = UIImageView()

    var messageImageView = UIImageView()
    var messageView = CustomMessageView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        creatSubView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func creatSubView() {
        self.contentView.backgroundColor = UIColor.white
        self.contentView.clipsToBounds = true

        self.selectionStyle = .none

        lineImageView.backgroundColor = UIColor.lightGray
        self.contentView.addSubview(lineImageView)
        lineImageView.snp.makeConstraints({ (make) in
            make.width.equalTo(1)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.center.equalTo(self.contentView)
        })

        messageView.backgroundColor = UIColor.red
        self.contentView.addSubview(messageView)
        messageView.snp.makeConstraints({ (make) in
            make.height.equalTo(30)
            make.width.equalTo(80)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
            make.centerX.equalTo(self.contentView.snp.centerX)
        })

        circleImageView.backgroundColor = UIColor.blue
        circleImageView.layer.cornerRadius = 12
        circleImageView.clipsToBounds = true
        self.contentView.addSubview(circleImageView)
        circleImageView.snp.makeConstraints({ (make) in
            make.width.height.equalTo(24)
            make.centerX.equalTo(self.contentView)
            make.top.equalTo(messageView.snp.top).offset(3)
        })
    }

    func updateCell(array: [String],isLeft: Bool) {
        //假设一行的高度是30
        if(isLeft){
            messageView.snp.remakeConstraints { (make) in
                make.top.equalTo(10)
                make.bottom.equalTo(-10)
                make.right.equalTo(self.contentView.snp.centerX).offset(-25)
            }
        }else{
            messageView.snp.remakeConstraints { (make) in
                make.top.equalTo(10)
                make.bottom.equalTo(-10)
                make.left.equalTo(self.contentView.snp.centerX).offset(25)
            }
        }
        messageView.updateViewWithMessageArray(messageArr: array)
    }
}

//显示多行label部分
class CustomMessageView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateViewWithMessageArray(messageArr:[String]) {
        for tmpView in self.subviews{
            tmpView.removeFromSuperview()
        }
        let topAndBottomDistance = 8
        let leftAndRightDistance = 10
        let middleDistance = 8   //label之间的间距
        var lastLabel: UILabel?
        for (index,text) in messageArr.enumerated(){
            let nowLabel = UILabel()
            nowLabel.textColor = UIColor.black
            nowLabel.font = UIFont.systemFont(ofSize: 10)
            nowLabel.text = text
            nowLabel.numberOfLines = 1
            self.addSubview(nowLabel)
            if let lastLabel = lastLabel { // 有值
                nowLabel.snp.makeConstraints { (make) in
                    make.left.equalTo(leftAndRightDistance)
                    make.right.equalTo(-leftAndRightDistance)
                    make.top.equalTo(lastLabel.snp.bottom).offset(middleDistance)
                }
            }else {
                nowLabel.snp.makeConstraints { (make) in
                    make.left.equalTo(leftAndRightDistance)
                    make.right.equalTo(-leftAndRightDistance)
                    make.top.equalTo(topAndBottomDistance)
                }
            }
            lastLabel = nowLabel
            if(index == messageArr.count-1){
                nowLabel.snp.makeConstraints { (make) in
                    make.bottom.equalTo(-topAndBottomDistance)
                }
            }
        }
    }
}
