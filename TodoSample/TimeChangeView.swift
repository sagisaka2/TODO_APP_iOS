//
//  CategoryView.swift
//  TodoSample
//
//  Created by 匂坂 勇仁 on H30/11/26.
//  Copyright © 平成30年 TeamLab. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TimeChangeView: UIViewController {
    
    var now = Date()
    var category = String()
    var todoTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //ここでタイトルを設定
        self.title = "日付変更"
        self.view.backgroundColor = UIColor.white
        
        let viewWidth = UIScreen.main.bounds.size.width
        let viewHeight = UIScreen.main.bounds.size.height
        
        //Doneを作成
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped(sender:)))
        doneBtn.tintColor = UIColor.blue
        //ボタンを設置
        self.navigationItem.rightBarButtonItem = doneBtn
        
        //UIDatePickerのインスタンスを生成
        let datePicker = UIDatePicker()
        
        //datePickerの位置とサイズを設定
        datePicker.frame = CGRect(x: 0, y: viewHeight / 2 - 150, width: viewWidth, height: 300)
        
        //タイムゾーンの設定
        datePicker.timeZone = NSTimeZone.local
        
        //データ選択時の処理内容の設定
        datePicker.addTarget(self, action: #selector(TimeChangeView.changeDate(sender:)), for: .valueChanged)
        
        //datePickerをViewに追加
        self.view.addSubview(datePicker)
    }
    
    //データ選択時の処理
    @objc internal func changeDate(sender: UIDatePicker) {
        print("change")
        now = sender.date
    }
    
    func getNowClockString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM月dd日"
        return formatter.string(from: now)
    }
    
    @objc func doneTapped(sender: UIDatePicker) {
        let todoCreate = TodoCreate()
        todoCreate.timeSchedule = getNowClockString()
        todoCreate.category = category
        todoCreate.todoTitle = todoTitle
        print(getNowClockString())
        self.navigationController?.pushViewController(todoCreate, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
