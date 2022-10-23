//
//  ViewController.swift
//  UserProfileApp
//
//  Created by arifinfrds.engineer on 17/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = RemoteUserProfileService()
        service.loadUserProfile(id: 1) { result in
            print(result)
        }
    }
}

