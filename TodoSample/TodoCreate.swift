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

class TodoCreate: UIViewController {
    var disposeBag = DisposeBag()
    var textfield: UITextField!
    var text = String()
    var text1 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //ここでタイトルを設定
        self.title = "TODO追加"
        self.view.backgroundColor = UIColor.white
        
        textfield = UITextField()
        let viewWidth = UIScreen.main.bounds.size.width
        let viewHeight = UIScreen.main.bounds.size.height
        
        textfield.frame = CGRect(x: 0, y: 118, width: viewWidth, height: 50)
        
        //アウトラインを表示
        textfield.borderStyle = .roundedRect
        
        //入力している文字を全消しするclearボタンを設定(書いている時のみの設定)
        textfield.clearButtonMode = .whileEditing
        
        //改行ボタンを完了ボタンに変更
        textfield.returnKeyType = .done
        
        //文字が何も入力されていない時に表示される文字(薄っすら見える文字)
        textfield.placeholder = "入力してください"
        
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
        
        //timeChangeBtnに移動するボタン
        let timeChangeBtn = UIButton()
        timeChangeBtn.frame = CGRect(x: 0, y: 168, width: viewWidth, height: 50)
        timeChangeBtn.addTarget(self, action: #selector(timeChangeBtnTapped), for: .touchUpInside)
        timeChangeBtn.setTitle("時間", for: .normal)
        timeChangeBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        timeChangeBtn.backgroundColor = UIColor.blue
        self.view.addSubview(timeChangeBtn)
        
        //セカンドビューに移動するボタン
        let categoryBtn = UIButton()
        categoryBtn.frame = CGRect(x: 0, y: 218, width: viewWidth, height: 50)
        categoryBtn.addTarget(self, action: #selector(categoryBtnTapped), for: .touchUpInside)
        categoryBtn.setTitle("カテゴリ一覧", for: .normal)
        categoryBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        categoryBtn.backgroundColor = UIColor.brown
        self.view.addSubview(categoryBtn)
        
        let label = UILabel(frame: CGRect(x: viewWidth-100, y: 198, width: 100, height: 20))
        
        label.text = text
        // 文字の色を白にする.
        label.textColor = UIColor.white
        
        self.view.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: viewWidth-100, y: 248, width: 100, height: 20))
        
        label1.text = text1
        // 文字の色を白にする.
        label1.textColor = UIColor.white
        
        self.view.addSubview(label1)
        
    }
    
    @objc func timeChangeBtnTapped() {
        let secondVC = TimeChangeView()
        secondVC.text1 = text1
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func categoryBtnTapped() {
        let thirdVC = CategoryView()
        thirdVC.text = text
        self.navigationController?.pushViewController(thirdVC, animated: true)
    }
    
    @objc func cancelTapped() {
        let secondVC = ViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    @objc func doneTapped() {
        let secondVC = ViewController()
        print(secondVC.myItems.count)
        secondVC.myItems.append(text)
        secondVC.titleName.append(text1)
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
