//
//  DetaillViewController.swift
//  dicoding-table-dynamic
//
//  Created by Ricky Primayuda Putra on 12/07/24.
//

import UIKit

class DetaillViewController: UIViewController {

    @IBOutlet weak var academyImage: UIImageView!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    var academy: AcademyModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = academy {
              nameLabel.text = result.name
              descLabel.text = result.description
              academyImage.image = result.image
            }
    }

}
