//
//  ViewController.swift
//  TableView
//
//  Created by 김지태 on 2022/03/09.
//

import UIKit

class ViewController: UIViewController {
    
    var persons = [Person]()

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    }
    @IBAction func registerBtn(_ sender: Any) {
        
        guard let name = nameTextField.text else { return }
        guard let age = ageTextField.text else { return }
        guard let city = cityTextField.text else { return }
        
        let person = Person(name: name, age: age, city: city)
        
        persons.append(person)
        mainTableView.reloadData()
    }
    

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell.init(style: .subtitle, reuseIdentifier: "myCell")
//        cell.textLabel?.text = "\(indexPath.row)"
//        cell.detailTextLabel?.text = indexPath.description
//        cell.imageView?.image = UIImage(named: "g90")
        
        let cell = mainTableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        let person = persons[indexPath.row]
        cell.nameLabel.text = person.name
        cell.ageLabel.text = person.age
        cell.cityLabel.text = person.city
        return cell
    }
}

extension ViewController: UITableViewDelegate {
     
}
