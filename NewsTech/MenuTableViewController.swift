//
//  MenuTableViewController.swift
//  NewsTech
//
//  Created by Karizma LTD on 27/07/2017.
//  Copyright © 2017 Karizma LTD. All rights reserved.
//

import UIKit
import Parse
import SDWebImage
import Toast_Swift


class MenuTableViewController: UITableViewController {
    
    @IBOutlet var logoMenuOutlet: UIImageView!
    
    @IBOutlet var avatarOutlet: UIImageView!
    @IBOutlet var fullName: UILabel!
    
    @IBOutlet var menuTableView: UITableView!
    
    var style = ToastStyle()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarOutlet.layer.cornerRadius = avatarOutlet.frame.height/2
        avatarOutlet.layer.masksToBounds = true
        
        if PFUser.current() != nil {
            logoMenuOutlet.isHidden = true
            fullName.isHidden = false
            avatarOutlet.isHidden = false
            fullName.text = PFUser.current()?.value(forKey: "fullName") as! String?
            avatarOutlet.sd_setImage(with: URL(string: (PFUser.current()?.value(forKey: "avatar") as! String?)! ), placeholderImage: UIImage(named: "Placeholder"), options: SDWebImageOptions()) { (image, error, cacheType, url) in
                if image != nil {
                    self.avatarOutlet.image = image
                }
            }
        }
        
    }
    
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if PFUser.current() != nil {
            return 11
        }
        return 10
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let stb = UIStoryboard(name: "Main", bundle: nil)
        let navController = self.slideMenuController()?.mainViewController as! UINavigationController
        
        
        var currentView : UIViewController!
        
        switch indexPath.row {
            
            
        case 0:
            currentView = stb.instantiateViewController(withIdentifier: "MainPostView")
            self.slideMenuController()?.closeRight()
            navController.viewControllers.removeLast(navController.viewControllers.count - 1)
            break;
        case 1:
            
            currentView = stb.instantiateViewController(withIdentifier: "FamousPostViewController")
            self.slideMenuController()?.closeRight()
            if navController.topViewController?.className != currentView.className {
                if navController.viewControllers.count > 1{
                    navController.viewControllers.removeLast()
                }
                navController.pushViewController(currentView, animated: false)
            }
            break;
            
        case 2:
            currentView = stb.instantiateViewController(withIdentifier: "CategoryViewController")
            self.slideMenuController()?.closeRight()
            if navController.topViewController?.className != currentView.className {
                if navController.viewControllers.count > 1{
                    navController.viewControllers.removeLast()
                }
                navController.pushViewController(currentView, animated: false)
            }
            break;
            
        case 3:
            currentView = stb.instantiateViewController(withIdentifier: "FamousTagsTableViewController")
            self.slideMenuController()?.closeRight()
            
            if navController.topViewController?.className != currentView.className {
                if navController.viewControllers.count > 1{
                    navController.viewControllers.removeLast()
                }
                navController.pushViewController(currentView, animated: false)
            }
            break;
        case 4:
            if PFUser.current() == nil{
                self.style.backgroundColor = UIColorFromRGB(rgbValue: 0xcfced5)
                self.style.messageColor = UIColorFromRGB(rgbValue: 0xff0038)
                self.view.makeToast("يجب عليك تسجيل الدخول أولا", duration: 2, position: .bottom, title: "click to register", image: nil, style: self.style, completion: { (didTap) in
                    if didTap {
                        currentView = stb.instantiateViewController(withIdentifier: "LogInViewController")
                        self.present(currentView, animated: true, completion: nil)
                    }
                })
              
            }else {
                currentView = stb.instantiateViewController(withIdentifier: "LikedPostViewController")
                self.slideMenuController()?.closeRight()
                if navController.topViewController?.className != currentView.className {
                    if navController.viewControllers.count > 1{
                        navController.viewControllers.removeLast()
                    }
                    navController.pushViewController(currentView, animated: false)
                }
            }
            break;
            
        case 10:
            currentView = stb.instantiateViewController(withIdentifier: "LogInViewController")
            PFUser.logOutInBackground(block: { (error) in
                if error == nil {
                    print("logout")
                    self.slideMenuController()?.closeRight()
                    self.present(currentView, animated: true, completion: nil)
                }
            })
            break;
            
        default:
            self.slideMenuController()?.closeRight()
        }
        
    }
    
}
extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
