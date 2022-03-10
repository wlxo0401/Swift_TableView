//
//  ViewController.swift
//  TableView
//
//  Created by 김지태 on 2022/03/09.
//

import UIKit

class SecondViewController: UIViewController {
    
    var cities = [City]()
    var cars = [Car]()

    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var carNameTextField: UITextField!
    
    @IBOutlet weak var selectRow: UILabel!
    
    @IBOutlet weak var cityTableView: UITableView!
    @IBOutlet weak var carTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cityTableView.delegate = self
        cityTableView.dataSource = self
        
        carTableView.delegate = self
        carTableView.dataSource = self
    }
    
    @IBAction func addCityBtn(_ sender: Any) {
        guard let cityName = cityNameTextField.text else { return }
        
        let city = City(city: cityName)
        
        cities.append(city)
        cityTableView.reloadData()
    }
    
    @IBAction func addCarBtn(_ sender: Any) {
        guard let carName = carNameTextField.text else { return }
        
        let car = Car(car: carName)
        
        cars.append(car)
        carTableView.reloadData()
    }
    
    
}

extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == cityTableView {
            return cities.count
        }
        if tableView == carTableView {
            return cars.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == cityTableView {
            let cell = cityTableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityTableViewCell
            let city = cities[indexPath.row]
            cell.cityLabel.text = city.city
            return cell
        }
        if tableView == carTableView {
            let cell = carTableView.dequeueReusableCell(withIdentifier: "carNameCell", for: indexPath) as! CarTableViewCell
            let car = cars[indexPath.row]
            cell.carLabel.text = car.car
            return cell
        }
        return UITableViewCell()
    }
}

extension SecondViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == cityTableView {
            let text = cities[indexPath.row].city
            selectRow.text = text
        }
        if tableView == carTableView {
            let text = cars[indexPath.row].car
            selectRow.text = text
        }
    }
}
