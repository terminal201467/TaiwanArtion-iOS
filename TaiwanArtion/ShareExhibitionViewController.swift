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
        setNavigationBar()
        setTable()
        setAddPhoto()
    }
    
    //MARK: - UI SetUp
    private func setNavigationBar() {
        title = "建立展覽"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setTable() {
        let dataSource = RxTableViewSectionedReloadDataSource<ExhibitionDetailModel> { (dataSource, tv, ip, element) in
            let section = Sections(rawValue: ip.section)
            let cell = tv.dequeueReusableCell(withIdentifier: ShareExhibitionTableViewCell.identifier, for: ip) as! ShareExhibitionTableViewCell
            cell.exhibitionName.text = "\(element)"
            switch section {
            case .name: print("name")
            case .city: cell.downButton.isHidden = false
            case .place: cell.downButton.isHidden = false
            case .webSite: print("webSite")
            case .none: print("none")
            }
            return cell
        }
        
        dataSource.titleForHeaderInSection = { ds, index in
            return ds.sectionModels[index].sectionName
        }
        
        viewModel.tableItems.bind(to: shareView.table.rx.items(dataSource:dataSource))
            .disposed(by: disposeBag)
    }
    
    private func setAddPhoto() {
        shareView.addAction = {
            let addPhotoViewController = AddPhotoViewController()
            self.navigationController?.pushViewController(addPhotoViewController, animated: true)
            
        }
    }
}

