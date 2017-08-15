//
//  ViewController.swift
//  Gestures
//
//  Created by 朱力 on 2017/8/14.
//  Copyright © 2017年 朱力. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pinchGesture : UIPinchGestureRecognizer!
    @IBOutlet weak var imageView: UIImageView!
    var image = UIImage(named: "wink.png")
    
    var lastScale: CGFloat = 1;
    var currentScale: CGFloat = 1;
    var startWidth: CGFloat = 200
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.pinch(_ :)))
        view.addGestureRecognizer(pinchGesture)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        startWidth = imageView.frame.size.width
        
        view.removeGestureRecognizer(pinchGesture)
        pinchGesture = nil
    }

    func pinch(_ pinch: UIPinchGestureRecognizer){
        if (pinch.state == .began) {
            lastScale = 1
        }else if (pinch.state == .changed)  {
            let delta = pinch.scale - lastScale
            currentScale += delta
            lastScale = pinch.scale
        }
        print(currentScale)
        print(startWidth)
        updateImageSize()
    }
    
    func updateImageSize() {
        for constraint in imageView.constraints{
            if constraint.identifier == "widthConstraint" {
                constraint.constant = startWidth * currentScale
                break
            }
        }
    }
}

