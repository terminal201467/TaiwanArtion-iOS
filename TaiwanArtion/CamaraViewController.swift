//
//  CamaraViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2023/2/20.
//

import Foundation
import Photos
import UIKit

class CamaraViewController: UIViewController {
    
    //MARK: -LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        if authorize() {
            print("開啟相機權限")
        }
    }
    
    //MARK: -Methods
    func authorize() -> Bool {
        let photoLibraryStatus = PHPhotoLibrary.authorizationStatus() //相簿請求
        let camStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video) //相機請求
        switch (camStatus, photoLibraryStatus){ //判斷狀態
        case (.authorized,.authorized): //兩個都允許
            return true
        case (.notDetermined,.notDetermined): //兩個都還未決定,就請求授權
            AVCaptureDevice.requestAccess(for: AVMediaType.video,  completionHandler: { (status) in
                DispatchQueue.main.async(execute: {
                    _ = self.authorize()
                })
            })
            PHPhotoLibrary.requestAuthorization({ (status) in
                DispatchQueue.main.async(execute: {
                    _ = self.authorize()
                })
            })
        case (.authorized,.notDetermined): //相機允許，相簿未決定，相簿請求授權
            PHPhotoLibrary.requestAuthorization({ (status) in
                DispatchQueue.main.async(execute: {
                    _ = self.authorize()
                })
            })
        case (.authorized,.denied): //相機允許，相簿拒絕，做出提醒
            DispatchQueue.main.async(execute: {
                let alertController = UIAlertController(title: "提醒", message: "您目前拍攝的照片並不會儲存至相簿，要前往設定嗎?", preferredStyle: .alert)
                let canceAlertion = UIAlertAction(title: "取消", style: .cancel, handler: {(status) in})
                let settingAction = UIAlertAction(title: "設定", style: .default, handler: { (action) in
                    let url = URL(string: UIApplication.openSettingsURLString)
                    if let url = url, UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                                print("跳至設定")
                            })
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                })
                alertController.addAction(canceAlertion)
                alertController.addAction(settingAction)
                self.present(alertController, animated: true)
            })
        default: //預設，如都不是以上狀態
            DispatchQueue.main.async(execute: {
                let alertController = UIAlertController(title: "提醒", message: "請點擊允許才可於APP內開啟相機及儲存至相簿", preferredStyle: .alert)
                let canceAlertion = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                let settingAction = UIAlertAction(title: "設定", style: .default, handler: { (action) in
                    let url = URL(string: UIApplication.openSettingsURLString)
                    if let url = url, UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url, options: [:], completionHandler: { (success) in
                                print("跳至設定")
                            })
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    }
                })
                alertController.addAction(canceAlertion)
                alertController.addAction(settingAction)
                self.present(alertController, animated: true, completion: nil)
            })
        }
        return false
    }
    
}
