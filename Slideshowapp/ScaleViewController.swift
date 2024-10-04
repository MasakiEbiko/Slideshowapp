//
//  ScaleViewController.swift
//  Slideshowapp
//
//  Created by mba2408.spacegray kyoei.engine on 2024/10/04.
//

import UIKit

class ScaleViewController: UIViewController {
    
    var prmImage : UIImage! = nil
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = prmImage
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
