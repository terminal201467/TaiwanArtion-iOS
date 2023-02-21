//
//  ShareExhibitionViewController.swift
//  TaiwanArtion
//
//  Created by 羅承志 on 2022/4/18.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay
import RxDataSources

enum Sections: Int, CaseIterable {
    case name = 0, city, place, webSite
    var discription: String {
        switch self {
        case .name: return "輸入展覽名稱"
        case .city: return "選擇縣市"
        case .place: return "選擇單位"
        case .webSite: return "輸入網址"
        }
    }
}

enum Mode: Int {
    case preview = 0, edit, release
}

class ShareExhibitionViewController: UIViewController, UIScrollViewDelegate {
    
    private let shareView = ShareExhibitionView()
    
    private var viewModel: ShareExhibitionViewModel
    
    private let disposeBag = DisposeBag()
    
    private var isPreviewMode: Bool = false
    
    //MARK: -initialize
    init(viewModel: ShareExhibitionViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - LifeCycle
    override func loadView() {
        super.loadView()
        view = shareView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        setTable()
        setAddPhoto()
        setTapGesture()
        setReleaseAction()
        setPreviewAction()
        viewModel.get()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    //MARK: - UI SetUp
    private func setNavigationBar() {
        title = "建立展覽"
        navigationController?.navigationBar.prefersLargeTitles = true
        setIsPreviewModeUI(with: .edit)
    }
    
    private func setIsPreviewModeUI(with mode: Mode) {
        switch mode {
        case .preview:
            shareView.scrollFooter.previewButton.setTitle("回到編輯", for: .normal)
        case .edit:
            navigationController?.navigationBar.tintColor = .backgroundColor
            navigationController?.navigationItem.leftBarButtonItem = nil
            shareView.scrollFooter.previewButton.setTitle("預覽", for: .normal)
        case .release:
            print("release")
            navigationController?.navigationBar.tintColor = .backgroundColor
            navigationController?.navigationItem.leftBarButtonItem = nil
            shareView.scrollFooter.previewButton.setTitle("預覽", for: .normal)
        }
    }
    
    private func setGrayPreviewBar() {
        
    }
    
    private func setIsFramePush(trigger: Bool) {
        if trigger {
            self.view.frame.origin.y = -200
        } else {
            self.view.frame.origin.y = 0
        }
    }
    
    private func setTable() {
        let dataSource = RxTableViewSectionedReloadDataSource<ExhibitionDetailModel> { (dataSource, tv, ip, element) in
            let section = Sections(rawValue: ip.section)
            switch section {
            case .name:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTextFieldTableViewCell.identifier, for: ip) as! ShareExhibitionTextFieldTableViewCell
                cell.textField.placeholder = "輸入展覽名稱"
                cell.textField.tag = 0
                cell.textFieldTrigger = {
                    self.setIsFramePush(trigger: $0)
                }
                cell.textChanged = { self.viewModel.receiveName(with: $0) }
                return cell
            case .city:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTableViewCell.identifier, for: ip) as! ShareExhibitionTableViewCell
                cell.name.text = "\(element)"
                cell.selectionStyle = .none
                cell.choosed = {
                    let filterViewController = FilterViewController(viewModel: FilterViewModel())
                    self.navigationController?.pushViewController(filterViewController, animated: true)
                    filterViewController.itemChoose = {
                        cell.name.text = $0
                        self.viewModel.receiveCity(with: $0)
                        cell.name.textColor = .textBlack464646
                    }
                }
                return cell
            case .place:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTableViewCell.identifier, for: ip) as! ShareExhibitionTableViewCell
                cell.name.text = "\(element)"
                cell.selectionStyle = .none
                cell.choosed = {
                    let placeChooseController = PlaceChooseViewController()
                    self.navigationController?.pushViewController(placeChooseController, animated: true)
                    placeChooseController.choosePlaceKind = {
                        cell.name.text = $0
                        self.viewModel.receivePlaceKind(with: $0)
                        cell.name.textColor = .textBlack464646
                    }
                }
                return cell
            case .webSite:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTextFieldTableViewCell.identifier, for: ip) as! ShareExhibitionTextFieldTableViewCell
                cell.textField.placeholder = "輸入網址"
                cell.textField.tag = 1
                cell.textFieldTrigger = { self.setIsFramePush(trigger: $0) }
                cell.textChanged = { self.viewModel.receiveWebSite(with: $0) }
                return cell
            case .none: print("none")
            }
            return UITableViewCell()
        }
        
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].sectionName
        }
        
        viewModel.tableItems.bind(to: shareView.table.rx.items(dataSource:dataSource))
            .disposed(by: disposeBag)
    }
    
    private func setTapGesture() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(touch))
        recognizer.numberOfTapsRequired = 1
        recognizer.numberOfTouchesRequired = 1
        view.addGestureRecognizer(recognizer)
    }

    @objc private func touch() {
        self.view.endEditing(true)
    }
    
    private func setAddPhoto() {
        shareView.addAction = {
            let addPhotoViewController = AddPhotoViewController(viewModel: AddPhotoViewModel())
            self.navigationController?.pushViewController(addPhotoViewController, animated: true)
            self.navigationController?.navigationBar.tintColor = .brownColor
            addPhotoViewController.returnSelectedItems = { photos in
                self.viewModel.receivePhotos(with: photos)
                self.shareView.scrollHeader.photos = photos
            }
        }
    }
    
    
    //MARK: - Send Data and Checking
    private func setPreviewAction() {
        shareView.previewActions = { isPreviewMode in
            if isPreviewMode {
                self.setIsPreviewModeUI(with: .preview)
                print("previewAction:\(self.viewModel.preview())")
            } else {
                self.setIsPreviewModeUI(with: .edit)
            }
        }
    }
    
    private func setReleaseAction () {
        shareView.releaseActions = {
            if self.viewModel.preview() == "資料無缺漏" {
                self.viewModel.release()
                self.setIsPreviewModeUI(with: .release)
                print("releaseAction")
            }
            let alert = AlertViewController()
            self.present(alert, animated: true)
        }
    }
    
}

