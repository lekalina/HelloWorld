//
//  ViewController.swift
//  HelloWorld
//
//  Created by Becky Santoro on 6/6/19.
//  Copyright © 2019 Becky Santoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, APIControllerProtocol {
    
    let api = APIController()
    
    var tableData: [MyItem?] = []
    
    let kCellIdentifier: String = "SearchResultCell"
    
    @IBOutlet weak var appsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("table data count = \(tableData.count)")
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "MyTestCell")
        let cell: UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: kCellIdentifier)
        
        let app = tableData[indexPath.row]!
        
        cell.textLabel?.text = app.indexName
        cell.detailTextLabel?.text = String(app.price)
        
        return cell
    }
    
    // This is the OnItemClickListener method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected row = \(indexPath.row)")
        // Get the row data for the selected row
        if let rowData = self.tableData[indexPath.row] {
            // Get the name of the track for this row
            let alert = UIAlertController(title: rowData.indexName, message: String(rowData.price), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        api.delegate = self
        // Do any additional setup after loading the view.
        self.api.getMajorIndexes()
    }
    
    func didReceiveAPIResults(results: [MyItem]) {
        print("testing inside did receive")
        // Refresh the table with the new dat
        DispatchQueue.main.async {
            self.tableData = results
            self.appsTableView.reloadData()
        }
    }

}

