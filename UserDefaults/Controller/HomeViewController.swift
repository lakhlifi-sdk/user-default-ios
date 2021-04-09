//
//  HomeViewController.swift
//  UserDefaults
//
//  Created by Lakhlifi Essaddiq on 4/6/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    

    @IBOutlet var tableView : UITableView!
    @IBOutlet weak var homeLabel: UILabel!
    var message = String()	
    var emploiyesList = [Emploiyee]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //view.backgroundColor = UIColor.white
        //TODO: - use this class to configurate home
        // Do any additional setup after loading the view.
        print("\(message)")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        getData()
    }
    
    let list: [String] = ["hello word","this is "," tabel ", "view", "controller"]
    
    func getData(){
        
        AF.request("http://dummy.restapiexample.com/api/v1/employees").responseJSON{
            (data) in
            guard let value = data.value else {return}
            //print(value)
            let json =  JSON(value)
            
            guard let em = json["data"].arrayObject as? [[String: String]] else {
                return
            }
            //print(em)
            self.emploiyesList = em.map{
                Emploiyee(id: Int($0["id"] ?? "")!, employee_name: $0["employee_name"]!, employee_salary: $0["employee_salary"]!, employee_age: Int($0["employee_age"] ?? "")!, profile_image: $0["profile_image"]!)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    @IBAction func logOut(_ sender: Any) {
        
        let userDefault = UserDefaults.standard
        userDefault.setValue("false", forKey: "switch")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Main")
        navigationController?.pushViewController(vc,animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        emploiyesList.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableTableViewCell
        let empl = emploiyesList[indexPath.row]
        cell?.name.text = "name: \(empl.employee_name)"
        cell?.age.text = "age: \(empl.employee_age)"
        return cell!
    }

}

