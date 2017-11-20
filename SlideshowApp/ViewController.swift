//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 長谷川勇斗 on 2017/11/18.
//  Copyright © 2017年 長谷川勇斗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var stepDownButton: UIButton!
    @IBOutlet weak var stepUpButton: UIButton!
    @IBOutlet weak var stopOrRestartButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var timer: Timer!
    var timer_sec: Int = 0
    let imageNameArray = [
        "images.jpg",
        "download.jpg",
        "sabo2.jpg",
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "images.jpg")
        imageView.contentMode = .scaleAspectFit
        //imageView.isUserInteractionEnabled = true
        imageView.image = image
        self.timer = Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        self.changeButtonLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func updateTimer(timer: Timer) {
        self.timer_sec += 2
        self.setImage(self.timer_sec)
    }
    func setImage(_ imageno : Int){
        let imageNo = (imageno / 2 ) % 3
        let image = UIImage(named: imageNameArray[imageNo])
        imageView.image = image
    }
    
    @IBAction func stepUP(_ sender: Any) {
        if self.timer == nil {
            self.timer_sec += 2
            self.setImage(self.timer_sec)
        }
    }

    @IBAction func stepDown(_ sender: Any) {
        if self.timer == nil {
            self.timer_sec -= 2
            self.setImage(self.timer_sec)
        }
    }
    
    func changeButtonLabel(){
        if self.timer == nil {
            stepUpButton.isEnabled = true
            stepDownButton.isEnabled = true
            stopOrRestartButton.setTitle("再生", for: [])
        }else{
            stepUpButton.isEnabled = false
            stepDownButton.isEnabled = false
            stopOrRestartButton.setTitle("停止", for: [])
        }
    }
    
    @IBAction func stopOrRestart(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            self.changeButtonLabel()
        }else{
            self.timer = Timer.scheduledTimer(timeInterval:2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            self.changeButtonLabel()
        }
    }
    
    @IBAction func onTouchView(_ sender: Any) {
        self.timer.invalidate()
        self.timer = nil
        self.changeButtonLabel()
        let imageNo = (self.timer_sec / 2 ) % 3
        performSegue(withIdentifier: "toSizeup", sender: UIImage(named: imageNameArray[imageNo]))
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSizeup" {
            let sizeupViewController = segue.destination as! SizeupViewController
            sizeupViewController.imageData = sender as! UIImage
        }
    }
    
}

