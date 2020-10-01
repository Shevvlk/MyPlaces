//
//  ListViewController.swift
//  MyPlaces
//
//  Created by Alexandr on 10.09.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    private let items : [String]
    
    init(items: [String]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
