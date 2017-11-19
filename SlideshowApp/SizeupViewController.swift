//
//  SizeupViewController.swift
//  SlideshowApp
//
//  Created by 長谷川勇斗 on 2017/11/18.
//  Copyright © 2017年 長谷川勇斗. All rights reserved.
//

import UIKit

class SizeupViewController: UIViewController {
    var imageData : UIImage!
    @IBOutlet weak var sizeupImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sizeupImageView.contentMode = .scaleAspectFit
        sizeupImageView.image = self.imageData
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
