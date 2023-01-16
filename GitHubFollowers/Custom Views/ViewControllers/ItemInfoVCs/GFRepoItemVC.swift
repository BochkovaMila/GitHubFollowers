//
//  GFRepoItemVC.swift
//  GitHubFollowers
//
//  Created by Mila B on 12.01.2023.
//

import UIKit

protocol GFRepoItemVCDelegate: AnyObject {
    func didTabGitHubProfile(for user: User)
    func didTapGetFollowers(for user: User)
}

class GFRepoItemVC: GFItemInfoVC {
    
    weak var delegate: GFRepoItemVCDelegate!
    
    
    init(user: User, delegate: GFRepoItemVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
            
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTabGitHubProfile(for: user)
    }
}
