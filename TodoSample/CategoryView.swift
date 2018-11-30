//
//  Time.swift
//  TodoSample
//
//  Created by 匂坂 勇仁 on H30/11/26.
//  Copyright © 平成30年 TeamLab. All rights reserved.
//

import UIKit

class CategoryView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //テーブルビューインスタンス
    private var myTableView: UITableView!
    
    private var myItems: NSArray = []
    
    private let refreshCtl = UIRefreshControl()
    var text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        //ここでタイトルを設定
        self.title = "Category Select"
        self.view.backgroundColor = UIColor.white

        //テーブルビューに表示する配列
        myItems = ["個人", "買い物", "仕事", "重要"]
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
        return self.myItems.count
    }
    
    //テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        cell.textLabel?.text = self.myItems[indexPath.row] as? String
        return cell
    }
    
    //テーブルビューのセルが押されたら呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)番のセルを選択しました！ ")
        print(myItems[indexPath.row])
        let todoVC = TodoCreate()
        todoVC.text1 = myItems[indexPath.row] as! String
        todoVC.text = text
        self.navigationController?.pushViewController(todoVC, animated: true)
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
