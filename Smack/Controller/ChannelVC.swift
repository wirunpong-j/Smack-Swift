//
//  ChannelVC.swift
//  Smack
//
//  Created by Wirunpong Jaingamlertwong on 7/1/2561 BE.
//  Copyright © 2561 Wirunpong Jaingamlertwong. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var channelTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        channelTableView.delegate = self
        channelTableView.dataSource = self
        
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIFY_USER_DATA_DID_CHANGE, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpUserInfo()
    }

    @IBAction func loginBtnPressed(_ sender: Any) {
        if AuthService.instance.isLoggedIn {
            // Show Profile Page
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
    }
    
    @objc func userDataDidChange(_ notify: Notification) {
        setUpUserInfo()
    }
    
    func setUpUserInfo() {
        if AuthService.instance.isLoggedIn {
            loginBtn.setTitle(UserDataService.instance.name, for: .normal)
            userImage.image = UIImage(named: UserDataService.instance.avatarName)
            userImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            loginBtn.setTitle("Login", for: .normal)
            userImage.image = UIImage(named: "menuProfileIcon")
            userImage.backgroundColor = UIColor.clear
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
}
