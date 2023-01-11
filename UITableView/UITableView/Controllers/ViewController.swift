//
//  ViewController.swift
//  UITableView
//
//  Created by Ahmed Salem on 11/01/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var basicTableView: UITableView!
    let SettingsTableViewData = ["Dark Mode", "Language", "Default Metal", "Default Currency"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Mark:- UITableView Self Delegation and DataSource
        basicTableView.delegate = self
        basicTableView.dataSource = self
        //Mark:- UITable Veiw registeration
        basicTableView.register(UITableViewCell.self,
                               forCellReuseIdentifier: "TableViewCell")
    }


}
// Mark:- Table data source and delegation
extension ViewController :UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SettingsTableViewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell",
                                                        for: indexPath)
        cell.textLabel?.text = SettingsTableViewData[indexPath.row]
        cell.textLabel?.font = UIFont(name:"Helvetica Neue Bold", size:17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

