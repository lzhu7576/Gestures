//
//  ViewController.swift
//  Gestures
//
//  Created by 朱力 on 2017/8/14.
//  Copyright © 2017年 朱力. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage(named: "wink.png")
    var flipped: Bool = false {
        didSet {
            if flipped {
               let temp = UIImage(cgImage: image!.cgImage!, scale: 1.0, orientation: .downMirrored)
                imageView.image = temp
            }else{
                imageView.image = image
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func flipImage(_ sender: Any) {
        flipped = !flipped
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

