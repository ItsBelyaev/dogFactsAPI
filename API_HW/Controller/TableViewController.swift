//
//  TableViewController.swift
//  API_HW
//
//  Created by Daniil Belyaev on 06.08.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var facts: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let alert = UIAlertController(title: "ВАЖНО", message: "Если нажать на ячейку, то появится алерт с полным фактом (некоторые больше текста на ячейке)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
        
        NetworkManager.shared.fetchData { factsFetched in
            for fact in factsFetched {
                self.facts.append(fact.fact)
                
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        facts.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = facts[indexPath.row]
        cell.textLabel?.textColor = .white
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Full fact", message: facts[indexPath.row], preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Thank you", style: .cancel) { action in
            tableView.deselectRow(at: indexPath, animated: true)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    

}
