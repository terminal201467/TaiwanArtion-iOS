//
//  ShareMember.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/6.
//

import UIKit

class ShareMember: UICollectionViewCell {
    
    static let identifier: String = "ShareMemberCell"
    
    @IBOutlet var selectItem: UIImageView!
    
    @IBOutlet var socialAppIcon: UIImageView!
    
    @IBOutlet var socialAppName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with photo: String, with icon: String?, name: String) {
        selectItem.image = UIImage(named: photo)
        socialAppName.text = name
        if icon == nil {
            socialAppIcon.isHidden = true
            socialAppName.text = name
        } else {
            socialAppIcon.isHidden = false
            socialAppIcon.image = UIImage(named: icon ?? "")
        }
    }
}
