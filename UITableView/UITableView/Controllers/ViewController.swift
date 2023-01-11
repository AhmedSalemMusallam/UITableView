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
        
        switch indexPath.row
        {
        case 0:
            cell.imageView?.image = UIImage(systemName: "moon")
            //here is programatically switch make to the table view
            let switchView = UISwitch(frame: .zero)
            switchView.setOn(false, animated: true)
            switchView.tag = indexPath.row // for detect which row switch Changed
//            switchView.addTarget(self, action: #selector(self.switchChanged(_:)), for: .valueChanged)
            cell.accessoryView = switchView
        case 1:
            cell.imageView?.image = UIImage(systemName: "globe")
        case 2:
            cell.imageView?.image = UIImage(systemName: "scanner.fill")
        case 3:
            cell.imageView?.image = UIImage(systemName: "coloncurrencysign.circle.fill")
        default:
            print("Do Not Do Any Thing")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 60
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

