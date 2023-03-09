//
//  ShareAlertViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/3/6.
//

import Foundation

enum ShareKinds: Int, CaseIterable {
    case header = 0, person, socialAPP, copyLink, addReadList
}

class ShareAlertViewModel {
    
    func numberOfRowInSection(_ section: Int) -> Int {
        ShareKinds.allCases.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> Any {
        switch ShareKinds(rawValue: indexPath.row) {
        case .header: return ""
        case .person: return ""
        case .socialAPP: return ["LineLogo","FacebookLogo","InstagramLogo","MessageLogo"]
        case .copyLink: return "Copy Link"
        case .addReadList: return "Add to Reading List"
        case .none: return ""
        }
    }
    
    func didSelectItemAt(indexPath: IndexPath) {
        print("selectedAt:\(indexPath.row)")
    }
    
}
