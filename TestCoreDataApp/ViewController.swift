//
//  ViewController.swift
//  TestCoreDataApp
//
//  Created by user167484 on 4/17/20.
//  Copyright © 2020 Allen Savio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Request.fetchData.execute(success: { (response, address: [Address]) in
//            address.forEach { print($0) }
//        }, failure: { (error) in
//            print(error)
//        })
//        DataManager.shared.saveEntity()
        DataManager.shared.saveEntity { (user: User, context) in
            user.name = "Savio"
            user.age = "21"
            let address = Address(context: context)
            address.city = "Hyd"
            address.state = "Telangana"
            user.address = address
            
            print("In success closure")
        }
        let users: [User] = DataManager.shared.fetchEntities()
        for user in users {
            print("\(user.name ?? "") \(user.age ?? "") \(user.address?.city ?? "") \(user.address?.state ?? "")")
        }
//        let address: [Address] = DataManager.shared.fetchEntities()
//        for place in address {
//            print(place.city)
//            print(place.state)
//        }
    }
}

