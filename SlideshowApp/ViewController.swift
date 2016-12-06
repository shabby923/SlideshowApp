//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 櫻井 敬紹 on 2016/12/01.
//  Copyright © 2016年 shabby923. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slideImage: UIButton!
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    
    
    var timer : Timer!
    var dispImageNo = 0
    var count = 0
    var ButtonPushed: Bool = true
    var photos = ["1.PNG","2.PNG", "3.PNG"]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: photos[0])
        slideImage.setImage(image, for: UIControlState())
        playButton.setTitle("再生", for: UIControlState())
        reverseButton.isEnabled = true
        moveButton.isEnabled = true
        slideImage.isUserInteractionEnabled = true
        slideImage.imageView!.contentMode = UIViewContentMode.scaleAspectFill
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timerInitialized() {
       timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: (#selector(ViewController.nextPage)), userInfo: nil, repeats: true)
    }
    
    func nextPage() {
        count += 1
        if count > 2 {
            count = 0
        }
        slideImage.setImage(UIImage(named: photos[count]), for: UIControlState())
    }

    
    @IBAction func reverseButton_Clicked(_ sender: AnyObject) {
        count -= 1
        if count < 0 {
            count = 2
        }
        slideImage.setImage(UIImage(named: photos[count]), for: UIControlState())
    }
    
    
    @IBAction func playButton_Clicked(_ sender: AnyObject) {
        
        if ButtonPushed == true {
            playButton.setTitle("停止", for: UIControlState())
            timerInitialized()
            reverseButton.isEnabled = false
            reverseButton.setTitleColor(UIColor.gray, for: UIControlState())
            moveButton.isEnabled = false
            moveButton.setTitleColor(UIColor.gray, for: UIControlState())
            
        } else {
            playButton.setTitle("再生", for: UIControlState())
            timer.invalidate()
            reverseButton.isEnabled = true
            moveButton.isEnabled = true
            reverseButton.setTitleColor(UIColor.black, for: UIControlState())
            moveButton.setTitleColor(UIColor.black, for: UIControlState())

        }
        
        ButtonPushed = !ButtonPushed
    }
    
    
    @IBAction func moveButton_Clicked(_ sender: AnyObject) {
        count += 1
        if count > 2 {
            count = 0
        }
        slideImage.setImage(UIImage(named: photos[count]), for: UIControlState())
    }
    
    @IBAction func returnToMain(_ segue: UIStoryboardSegue) {
        timerInitialized()
        
    }
    
    @IBAction func slideImage_clicked(_ sender: Any) {
        timer.invalidate()
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.Image = UIImage(named: photos[count])
  
    }
    

    
}

