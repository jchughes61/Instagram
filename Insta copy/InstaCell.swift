//
//  InstaCell.swift
//  Insta
//
//  Created by Jacob Hughes on 3/6/16.
//  Copyright © 2016 Jacob Hughes. All rights reserved.
//

import UIKit
import Parse
import AFNetworking
import ParseUI


class InstaCell: UITableViewCell {
    
    
    @IBOutlet weak var photoView: PFImageView!
    
    @IBOutlet weak var caption: UILabel!
    
    var post: PFObject! {
        didSet {
            self.caption.text = post["caption"] as? String
            
            if let userPicture = /*PFUser.currentUser()?*/post["media"] as? PFFile {
                userPicture.getDataInBackgroundWithBlock { (imageData: NSData?, error: NSError?) -> Void in
                    if (error == nil) {
                        
                        self.photoView.file = self.post["media"] as? PFFile
                        self.photoView.loadInBackground()
                    }
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
