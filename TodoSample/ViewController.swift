//
//  Todo.swift
//  ViewController
//
//  Created by 匂坂 勇仁 on H30/11/08.
//  Copyright © 平成30年 TeamLab. All rights reserved.
//
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //テーブルビューインスタンス
    private var myTableView: UITableView!
    
    var myItems = ["りんご", "すいか"]
    
    var titleName = ["aaaa", "bbbb"]
    
    var timeSchedule: NSArray = []
    
    private let refreshCtl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        //ここでタイトルを設定
        self.title = "TODO APP Sample"
        self.view.backgroundColor = UIColor.white
        
        let backBtn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.backBtnTapped))
        backBtn.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = backBtn
        
        timeSchedule = ["13:00", "15:00"]
        //Viewの大きさを取得
        let viewWidth = UIScreen.main.bounds.size.width
        let viewHeight = UIScreen.main.bounds.size.height
        
        //テーブルビューの初期化
        myTableView = UITableView()
        
        //デリゲートの設定
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //テーブルビューの大きさの指定
        myTableView.frame = CGRect(x: 0, y: 0, width: viewWidth, height: viewHeight)
        
        //テーブルビューの設置
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(myTableView)
        
        myTableView.separatorStyle = .none
        myTableView.tableFooterView = UIView()
        
    }
    
    //テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はmyItems配列の数とした
        print("cell")
        print(myItems.count)
        return myItems.count
    }
    
    //テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        print(indexPath.row)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = self.myItems[indexPath.row]
        cell.detailTextLabel?.text = self.titleName[indexPath.row]
        return cell
    }
    
    //テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番のセルを選択しました！ ")
    }

    @objc func backBtnTapped() {
        let todoVC = TodoCreate()
        self.navigationController?.pushViewController(todoVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
