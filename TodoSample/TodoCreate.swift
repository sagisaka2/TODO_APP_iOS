//
//  TodoCreate.swift
//  TodoSample
//
//  Created by 匂坂 勇仁 on H30/11/13.
//  Copyright © 平成30年 TeamLab. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TodoCreate: UIViewController, UITextFieldDelegate {
    var disposeBag = DisposeBag()
    var textfield: UITextField!
    var timeSchedule = String()
    var category = String()
    var todoTitle = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //ここでタイトルを設定
        self.title = "TODO追加"
        self.view.backgroundColor = UIColor.white
        textfield = UITextField()
        let viewWidth = UIScreen.main.bounds.size.width
        let viewHeight = UIScreen.main.bounds.size.height
        
        textfield.frame = CGRect(x: 0, y: self.navigationController!.navigationBar.bounds.size.height+20, width: viewWidth, height: 50)
        textfield.text = todoTitle
        //アウトラインを表示
        textfield.borderStyle = .roundedRect
        
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        textfield.clearButtonMode = .whileEditing
        
        //改行ボタンを完了ボタンに変更
        textfield.returnKeyType = .done
        
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        textfield.placeholder = "入力してください"
        
        textfield.delegate = self

        //viewにtextfieldをsubviewとして追加
        self.view.addSubview(textfield)
        
        //Cancelボタンを作成
        let cancelBtn = UIBarButtonItem(title: "Cancle", style: .plain, target: self, action: #selector(self.cancelTapped))
        cancelBtn.tintColor = UIColor.blue
        //ボタンを設置
        self.navigationItem.leftBarButtonItem = cancelBtn

        //Doneを作成
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneTapped))
        doneBtn.tintColor = UIColor.blue
        //ボタンを設置
        self.navigationItem.rightBarButtonItem = doneBtn
        
        //カテゴリ一覧に移動するボタン
        let categoryBtn = UIButton()
        categoryBtn.frame = CGRect(x: 0, y: self.navigationController!.navigationBar.bounds.size.height+70, width: viewWidth, height: 50)
        categoryBtn.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        categoryBtn.setTitle(" カテゴリ一覧", for: .normal)
        categoryBtn.setTitleColor(UIColor.black, for: .normal)
        categoryBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        categoryBtn.backgroundColor = UIColor.white
        categoryBtn.layer.borderWidth = 0.5
        categoryBtn.layer.cornerRadius = 5.0
        categoryBtn.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(categoryBtn)
        
        //時間に移動するボタン
        let timeChangeBtn = UIButton()
        timeChangeBtn.frame = CGRect(x: 0, y: self.navigationController!.navigationBar.bounds.size.height+120, width: viewWidth, height: 50)
        timeChangeBtn.addTarget(self, action: #selector(timeChangeBtnTapped), for: .touchUpInside)
        timeChangeBtn.setTitle(" 時間", for: .normal)
        timeChangeBtn.setTitleColor(UIColor.black, for: .normal)
        timeChangeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        timeChangeBtn.backgroundColor = UIColor.white
        timeChangeBtn.layer.borderWidth = 0.5
        timeChangeBtn.layer.cornerRadius = 5.0
        timeChangeBtn.layer.borderColor = UIColor.black.cgColor
        self.view.addSubview(timeChangeBtn)
        
        let labelCategory = UILabel(frame: CGRect(x: viewWidth-100, y: self.navigationController!.navigationBar.bounds.size.height+90, width: 100, height: 20))
        
        labelCategory.text = category + " >"

        labelCategory.textColor = UIColor.gray
        
        self.view.addSubview(labelCategory)
        
        let labelTimeSchedule = UILabel(frame: CGRect(x: viewWidth-100, y: self.navigationController!.navigationBar.bounds.size.height+140, width: 100, height: 20))
        
        labelTimeSchedule.text = timeSchedule + " >"

        labelTimeSchedule.textColor = UIColor.gray
        
        self.view.addSubview(labelTimeSchedule)
        
    }
    
    @objc func timeChangeBtnTapped() {
        let timeChangeView = TimeChangeView()
        timeChangeView.category = category
        timeChangeView.todoTitle = todoTitle
        self.navigationController?.pushViewController(timeChangeView, animated: true)
    }
    
    @objc func categoryBtnTapped() {
        let categoryView = CategoryView()
        categoryView.timeSchedule = timeSchedule
        categoryView.todoTitle = todoTitle
        self.navigationController?.pushViewController(categoryView, animated: true)
    }
    
    @objc func cancelTapped() {
        let viewController = ViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func doneTapped() {
        let viewController = ViewController()
        viewController.addTodo = (Todo(todoTitle, category, timeSchedule))
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        todoTitle = textfield.text! as String
        
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
