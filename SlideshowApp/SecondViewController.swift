//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 櫻井 敬紹 on 2016/12/01.
//  Copyright © 2016年 shabby923. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var largeImage: UIImageView!
    
    var Image: UIImage! = UIImage(named: "0.PNG")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        largeImage.image = Image

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButton_Clicked(_ sender: AnyObject) {
    }
  
    
}
