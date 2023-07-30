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
    
    var todo = ToDoInformation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoppingTableView.dataSource = self
        shoppingTableView.delegate = self
        
        shoppingTableView.rowHeight = 60
        
        designComponents()
        
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        if let text = addTextField.text {
            if text == "" {
                showAlert(message: "구매할 품목을 입력해주세요!")
            } else {
                todo.list.append(ToDo(title: text, check: false, like: false))
                addTextField.text = nil
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
        return todo.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ShoppingTableViewCell.identifier) as? ShoppingTableViewCell else {
            return UITableViewCell()
        }
        
        let row = todo.list[indexPath.row]
        
        cell.configureCell(row: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        todo.list[indexPath.row].check = todo.list[indexPath.row].check == true ? false : true
        shoppingTableView.reloadData()
    }
    
    
}
