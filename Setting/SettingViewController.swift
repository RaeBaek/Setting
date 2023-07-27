//
//  SettingViewController.swift
//  Setting
//
//  Created by 백래훈 on 2023/07/27.
//

import UIKit

class SettingViewController: UIViewController {
    
    @IBOutlet var settingTableView: UITableView!
    
    let allSet = ["공지사항", "실험실", "버전정보"]
    let privacySet = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let etc = ["고객센터/도움말"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        
    }
    
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "전체 설정"
        case 1: return "개인 설정"
        case 2: return "기타"
        default:
            return "오류"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return allSet.count
        case 1: return privacySet.count
        case 2: return etc.count
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell") else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = allSet[indexPath.row]
        case 1:
            cell.textLabel?.text = privacySet[indexPath.row]
        case 2:
            cell.textLabel?.text = etc[indexPath.row]
        default:
            return cell
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}
