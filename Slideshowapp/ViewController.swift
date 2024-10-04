//
//  ViewController.swift
//  Slideshowapp
//
//  Created by mba2408.spacegray kyoei.engine on 2024/10/03.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var timer : Timer! = nil
    var index:Int = 0
    var images:[UIImage] = [
        UIImage(named:"IMG_1")!,
        UIImage(named:"IMG_2")!,
        UIImage(named:"IMG_3")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(upScaling)))
        imageView.image = images[0]
    }
    
    @IBAction func sildeStartandStop(_ sender: Any?) {
        if timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval:2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
            self.startButton.setTitle("Silde Stop", for: .normal)
            self.startButton.setTitleColor(UIColor.white, for:.normal)
            self.startButton.backgroundColor = UIColor.red
            self.prevButton.isEnabled = false
            self.nextButton.isEnabled = false
        } else {
            self.timer.invalidate()
            self.timer = nil
            self.startButton.setTitle("Silde Start", for: .normal)
            self.startButton.setTitleColor(UIColor.blue, for:.normal)
            self.startButton.backgroundColor = UIColor.clear
            self.prevButton.isEnabled = true
            self.nextButton.isEnabled = true
        }
    }
    
    @IBAction func sildePrev(_ sender: Any) {
        let prevIndex:Int = self.index == 0 ? 2 : index - 1
        self.index = prevIndex
        imageView.image = images[prevIndex]
    }
    
    @IBAction func sildeNext(_ sender: Any) {
        let nextIndex:Int = self.index == images.count - 1 ? 0 : index + 1
        self.index = nextIndex
        imageView.image = images[nextIndex]
    }
    
    @objc func changeImage(){
        self.index += 1
        if self.index == images.count {
            self.index = 0
        }
        imageView.image = images[index]
    }
    /*
    @objc func alertIn(){
        let alert = UIAlertController(title: "あらーと", message: "アラートだよ！", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default){
            (action) in self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(ok)
        present(alert,animated: true, completion: nil)
    }
    */
    @objc func upScaling(){
        if timer != nil {
            sildeStartandStop(nil)
        }
        performSegue(withIdentifier: "upscaling", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "upscaling" {
            let scaleVC:ScaleViewController = segue.destination as! ScaleViewController
            scaleVC.prmImage = images[self.index]
        }
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
}

