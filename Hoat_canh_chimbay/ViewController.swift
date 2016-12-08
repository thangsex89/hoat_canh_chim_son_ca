//
//  ViewController.swift
//  Hoat_canh_chimbay
//
//  Created by Thang on 12/7/16.
//  Copyright © 2016 Thang. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var bird   = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        
        
        
        
        super.viewDidLoad()
        drawjungle()
          addbird()
         fly_up_and_down()
         playsong()

        // Do any additional setup after loading the view, typically from a nib.
    }

    func drawjungle() -> Void {
        let temp_image =  UIImage(named: "jungle.jpg") // tao ra 1 bien
        let background = UIImageView(image: temp_image)
      //  print(background.frame.size.width) // xem do rong cua cai anh
//      let background = UIImageView(image: #imageLiteral(resourceName: "jungle.jpg"))
       background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }
    func addbird() -> Void {
       
       bird = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 68))
        bird.animationImages =  [ UIImage(named : "bird0.png")!,
                                UIImage(named : "bird1.png")!,
                                 UIImage(named : "bird2.png")!,
                                 UIImage(named : "bird3.png")!,
                                  UIImage(named : "bird4.png")!,
                                   UIImage(named : "bird5.png")!
                                 ]
      
        bird.animationRepeatCount = 0
        bird.animationDuration = 5
        bird.startAnimating()
    
        self.view.addSubview(bird)
    }
    
    func fly_up_and_down() -> Void {//start

//        UIView.animate(withDuration: 4, animations: {
//            self.bird.center = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
//        }
//            , completion: ((Bool) -> Void)?)
        UIView.animate(withDuration: 5, animations: {             self.bird.center = CGPoint(x: self.view.bounds.size.width-50, y: self.view.bounds.size.height-50)
            
        }) { (finish) in
             self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            UIView.animate(withDuration: 6, animations: {
                self.bird.center = CGPoint(x: 0, y:self.view.bounds.size.height  )
            }) { (finish) in
//                self.bird.transform = CGAffineTransform.identity
//                self.fly_up_and_down()
                self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: -45))

                UIView.animate(withDuration: 6, animations: {
                    self.bird.center = CGPoint(x:self.view.bounds.size.width , y: 0 )
                })  { (finish) in
                    self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 45))
                  UIView.animate(withDuration: 6, animations: {
                    self.bird.center = CGPoint(x : 0, y: 0 )
                  }, completion: { (finish) in
                    self.bird.transform = CGAffineTransform.identity
                                   self.fly_up_and_down()
                  })
                    
                }
            }
          
            
        }
        
        
    }//end
    func playsong() -> Void {
     let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

