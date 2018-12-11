//
//  Todo.swift
//  ViewController
//
//  Created by 匂坂 勇仁 on H30/11/08.
//  Copyright © 平成30年 TeamLab. All rights reserved.
//
import UIKit
import RxSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //テーブルビューインスタンス
    private var myTableView: UITableView!
    
    var tableView: UITableView!
    
    var todoList = [Todo]()
    
    var disposeBag = DisposeBag()
    
    var addTodo = Todo.karaData
    
    private let refreshCtl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoList.append(Todo.dummyData1)
        todoList.append(Todo.dummyData2)
        todoList.append(Todo.dummyData3)
        
        if addTodo.todoTitle != "" && addTodo.category != "" && addTodo.timeSchedule != ""{
            todoList.append(addTodo)
        }
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        //ここでタイトルを設定
        self.title = "TODO APP Sample"
        self.view.backgroundColor = UIColor.white
        
        let backBtn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(self.backBtnTapped))
        backBtn.tintColor = UIColor.blue
        self.navigationItem.rightBarButtonItem = backBtn
        
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
        
//        let label = UILabel(frame: CGRect(x: viewWidth-100, y: self.navigationController!.navigationBar.bounds.size.height+40, width: 100, height: 20))
//
//        label.text = todoList[0].timeSchedule
//        label.textColor = UIColor.black
//
//        self.view.addSubview(label)
        
    }
    
    //テーブルビューのセルの数を設定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //テーブルビューのセルの数はtodoList配列の数
        return todoList.count
    }
    
    //テーブルビューのセルの中身を設定する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //myItems配列の中身をテキストにして登録した
        print(indexPath.row)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        
        cell.textLabel?.text = todoList[indexPath.row].todoTitle
        cell.detailTextLabel?.numberOfLines=0
        cell.detailTextLabel?.text = todoList[indexPath.row].category + "\n \t \t \t \t \t \t \t \t \t \t" + todoList[indexPath.row].timeSchedule
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
