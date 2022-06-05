//
//  YLSViewController.swift
//  Final Project
//
//  Created by mac on 3/12/22.
//

import UIKit

class AdvisorDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    @IBOutlet weak var image: UIImageView!
    
    var advisortype:Advisor?
    
    override func viewWillAppear(_ animated: Bool) {
        if let a = advisortype{
            titleLabel.text = a.name
            descriptionLabel.text = a.longDescription
            image.image = UIImage(named: "Lip")
            
        }
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
