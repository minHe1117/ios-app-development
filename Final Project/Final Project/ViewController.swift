//
//  ViewController.swift
//  Final Project
//
//  Created by mac on 3/12/22.
//

import UIKit

class HomeViewController: UIViewController {

    let container = UIView()
    let ylss = UIImageView(image: UIImage(named: "YSL"))
    let macs = UIImageView(image: UIImage(named: "MAC-1"))
    let arms = UIImageView(image: UIImage(named: "ARM"))
    let tfs = UIImageView(image: UIImage(named: "TF"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let w = view.bounds.width - 100
        let h = view.bounds.height - 100
        container.frame = CGRect(x: 50, y: 50, width: w, height: h)
        view.addSubview(container)
        
        ylss.frame = CGRect(x: 0, y: 0, width: w, height: h)
        macs.frame = ylss.frame
        arms.frame = ylss.frame
        tfs.frame = ylss.frame
        
        container.addSubview(macs)
        container.addSubview(arms)
        container.addSubview(tfs)
       
        
        // Set up swipe gesture recognizers
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action:
            #selector(HomeViewController.handleUpSwipe))
        upSwipeRecognizer.numberOfTouchesRequired = 1
        upSwipeRecognizer.direction = .up
        view.addGestureRecognizer(upSwipeRecognizer)
        
      /*  let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action:
            #selector(HomeViewController.handleDownSwipe))
        downSwipeRecognizer.numberOfTouchesRequired = 1
        downSwipeRecognizer.direction = .down
        view.addGestureRecognizer(downSwipeRecognizer)
        */
        let horizontalSwipeRecognizer = UISwipeGestureRecognizer(target: self, action:
            #selector(HomeViewController.handleHorizontalSwipe))
        horizontalSwipeRecognizer.numberOfTouchesRequired = 1
        horizontalSwipeRecognizer.direction = [ .left, .right ]
        view.addGestureRecognizer(horizontalSwipeRecognizer)
        
        let pinchGestureRecognizer = UIPinchGestureRecognizer(target: self, action:
            #selector(HomeViewController.handlePinch))
        view.addGestureRecognizer(pinchGestureRecognizer)
    }
    
    @objc
    func handleUpSwipe(_ sender: UISwipeGestureRecognizer) {
        let view1 = ylss.superview != nil ? ylss : macs
        let view2 = ylss.superview != nil ? macs : ylss
        UIView.transition(from: view1, to: view2,
                          duration: 2.0, options: .transitionCurlUp,
                          completion: nil)
        let view3 = macs.superview != nil ? macs : arms
        let view4 = macs.superview != nil ? arms: macs
        UIView.transition(from: view3, to: view4,
                          duration: 2.0, options: .transitionCurlUp,
                          completion: nil)
        let view5 = arms.superview != nil ? arms : tfs
        let view6 = arms.superview != nil ? tfs: arms
        UIView.transition(from: view5, to: view6,
                          duration: 2.0, options: .transitionCurlUp,
                          completion: nil)
    }
    
   /* @objc
    func handleDownSwipe(_ sender: UISwipeGestureRecognizer) {
        let view1 = b.superview != nil ? big_ben : eiffel
        let view2 = big_ben.superview != nil ? eiffel : big_ben
        UIView.transition(from: view1, to: view2,
                          duration: 2.0, options: .transitionCurlDown,
                          completion: nil)
    }
    */
    @objc
    func handleHorizontalSwipe(_ sender: UISwipeGestureRecognizer) {
        let view1 = ylss.superview != nil ? ylss : macs
        let view2 = ylss.superview != nil ? macs : ylss
        let view3 = macs.superview != nil ? macs : arms
        let view4 = macs.superview != nil ? arms: macs
        //let view5 = arms.superview != nil ? arms : tfs
        //let view6 = arms.superview != nil ? tfs: arms
        UIView.transition(with: self.container, duration: 2.0,
                          options: .transitionCrossDissolve,
                          animations: {
                            view1.removeFromSuperview()
                            self.container.addSubview(view2)
                           view2.removeFromSuperview()
                           self.container.addSubview(view3)
                           view3.removeFromSuperview()
                           self.container.addSubview(view4)
                           //view4.removeFromSuperview()
                          // self.container.addSubview(view5)
                          // view5.removeFromSuperview()
                          // self.container.addSubview(view6)
        }, completion: nil)

    }
    
    @objc
    func handlePinch(_ sender: UIPinchGestureRecognizer) {
        let s = sender.scale
        container.transform = CGAffineTransform(a: s, b: 0, c: 0, d: s, tx: 0, ty: 0)
    }
    
}


