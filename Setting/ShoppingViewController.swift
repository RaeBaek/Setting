//
//  ShoppingViewController.swift
//  Setting
//
//  Created by 백래훈 on 2023/07/27.
//

import UIKit

class ShoppingViewController: UIViewController {
    
    @IBOutlet var addView: UIView!
    @IBOutlet var addTextField: UITextField!
    @IBOutlet var addButton: UIButton!
    @IBOutlet var shoppingTableView: UITableView!
    
    var textArray = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingTableView.dataSource = self
        shoppingTableView.delegate = self
        
        designComponents()
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if let text = addTextField.text {
            if text == "" {
                showAlert(message: "구매할 품목을 입력해주세요!")
            } else {
                textArray.append(text)
            }
        } else {
            return
        }
        shoppingTableView.reloadData()
        view.endEditing(true)
        
    }
    
    @IBAction func keyboardReturnTapped(_ sender: UITextField) {
        view.endEditing(true)
    }
    
    @IBAction func gestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    func designComponents() {
        addView.backgroundColor = .systemGray6
        addView.layer.cornerRadius = 10
        
        addTextField.backgroundColor = .systemGray6
        addTextField.borderStyle = .none
        addTextField.placeholder = "무엇을 구매하실 건가요?"
        
        addButton.backgroundColor = .systemGray5
        addButton.tintColor = .black
        addButton.layer.cornerRadius = 10
        
    }

}

extension ShoppingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCell") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = textArray[indexPath.row]
        
        return cell
    }
    
    
}
