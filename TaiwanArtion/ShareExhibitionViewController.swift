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


class ShareExhibitionViewController: UIViewController, UIScrollViewDelegate {
    
    private let shareView = ShareExhibitionView()
    
    private var viewModel: ShareExhibitionViewModel
    
    private let disposeBag = DisposeBag()
    
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
        view.isUserInteractionEnabled = true
        setTable()
        setAddPhoto()
        setTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setNavigationBar()
    }
    
    //MARK: - UI SetUp
    private func setNavigationBar() {
        title = "建立展覽"
        navigationController?.navigationBar.prefersLargeTitles = true
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
                cell.textFieldTrigger = { self.setIsFramePush(trigger: $0) }
                return cell
            case .city:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTableViewCell.identifier, for: ip) as! ShareExhibitionTableViewCell
                cell.downButton.isHidden = false
                cell.exhibitionName.text = "\(element)"
                cell.selectionStyle = .none
                return cell
            case .place:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTableViewCell.identifier, for: ip) as! ShareExhibitionTableViewCell
                cell.downButton.isHidden = false
                cell.exhibitionName.text = "\(element)"
                cell.selectionStyle = .none
                return cell
            case .webSite:
                let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTextFieldTableViewCell.identifier, for: ip) as! ShareExhibitionTextFieldTableViewCell
                cell.textField.placeholder = "輸入網址"
                cell.textField.tag = 1
                cell.textFieldTrigger = { self.setIsFramePush(trigger: $0) }
                return cell
            case .none:
                print("none")
            }
            return UITableViewCell()
        }
        
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].sectionName
        }
        shareView.table.rx.itemSelected.subscribe { [weak self] indexPath in
            guard let section = indexPath.element?.section else { return }
            switch Sections(rawValue: section) {
            case .name:
                print("name")
            case .city:
                //推到城市選擇頁面
                let filterViewController = FilterViewController(viewModel: FilterViewModel())
                self?.navigationController?.pushViewController(filterViewController, animated: true)
            case .place:
                //推到單位選擇頁面
                let placeChooseController = PlaceChooseViewController()
                self?.navigationController?.pushViewController(placeChooseController, animated: true)
            case .webSite:
                print("webSite")
            case .none:
                print("")
            }
        }
        .disposed(by: disposeBag)
        
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
        }
    }
}

