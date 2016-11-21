//
//  DetailedViewController.swift
//  final_project
//
//  Created by Linna Wang on 11/13/16.
//  Copyright © 2016 Linna Wang. All rights reserved.
//

import UIKit

var hueVal: Float = 0.0
var willClear = false


class DetailedViewController: UIViewController {

    @IBOutlet weak var tangoContent: UILabel!
    
    @IBOutlet weak var canvas: UIImageView!
    
    var tango = "okonomi"
    override func viewDidLoad() {
        super.viewDidLoad()
        tangoContent.text = tango
        
        UIGraphicsBeginImageContext(CGSize(width: canvas.frame.width * ratio, height: canvas.frame.height * ratio))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    var path = UIBezierPath()
    var brushSize: CGFloat = 10
    var ratio: CGFloat = 3.0
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let p = touches.first!.location(in: canvas)
        path = UIBezierPath()
        path.move(to: CGPoint(x: p.x * ratio, y: p.y * ratio))
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let p = touches.first!.location(in: canvas)
        path.addLine(to: CGPoint(x: p.x * ratio, y: p.y * ratio))
        UIColor(hue: CGFloat(hueVal), saturation: 1.0, brightness: 1.0, alpha: 1.0).setStroke()
        path.lineWidth = brushSize
        path.lineCapStyle = CGLineCap.round
        path.stroke()
        canvas.image = UIGraphicsGetImageFromCurrentImageContext()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        coordinator.animate(alongsideTransition: nil, completion: clear)
    }
    
    
    
    func clear(_: UIViewControllerTransitionCoordinatorContext?) {
        UIGraphicsEndImageContext()
        UIGraphicsBeginImageContext(CGSize(width: canvas.frame.width * ratio, height: canvas.frame.height * ratio))
        canvas.image = nil
    }

    
    override func viewDidAppear(_ animated: Bool) {
        if (willClear) {
            clear(nil)
            willClear = false
        }
    }
    

}
