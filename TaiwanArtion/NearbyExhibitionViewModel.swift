//
//  NearbyExhibitionViewModel.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/11/5.
//

import RxRelay
import RxSwift
import RxCocoa

protocol NearByExhibitionViewModelInput {
    var viewDidLoad: PublishRelay<()> { get }
}

protocol NearByExhibitionViewModelOutput {
    var exhibitionInfo: Signal<[ExhibitionLocationInfo]> { get }
}

protocol NearByExhibitionViewModelType {
    var inputs: NearByExhibitionViewModelInput { get }
    var outputs: NearByExhibitionViewModelOutput { get }
}

class NearbyExhibitionViewModel: NearByExhibitionViewModelInput, NearByExhibitionViewModelOutput, NearByExhibitionViewModelType {
    var exhibitionInfo: Signal<[ExhibitionLocationInfo]>
    
    public var viewDidLoad: PublishRelay<()>
    
    public var inputs: NearByExhibitionViewModelInput { self }
    
    public var outputs: NearByExhibitionViewModelOutput { self }
    
    let locationInfos = [
        ExhibitionLocationInfo(
            exhibitionTitle: "會動的文藝復興",
            exhibitionImage: "1",
            buisinessType: true,
            buisinessTime: "11:30",
            location: "臺灣,台南市",
            distance: "2.3")
        ,
        ExhibitionLocationInfo(
            exhibitionTitle: "會動的文藝復興",
            exhibitionImage: "1",
            buisinessType: true,
            buisinessTime: "11:30",
            location: "臺灣,台南市",
            distance: "2.3")
        ,
        ExhibitionLocationInfo(
            exhibitionTitle: "會動的文藝復興",
            exhibitionImage: "1",
            buisinessType: true,
            buisinessTime: "11:30",
            location: "臺灣,台南市",
            distance: "2.3")
        ,
        ExhibitionLocationInfo(
            exhibitionTitle: "會動的文藝復興",
            exhibitionImage: "1",
            buisinessType: true,
            buisinessTime: "11:30",
            location: "臺灣,台南市",
            distance: "2.3")
        ,
        ExhibitionLocationInfo(
            exhibitionTitle: "會動的文藝復興",
            exhibitionImage: "1",
            buisinessType: true,
            buisinessTime: "11:30",
            location: "臺灣,台南市",
            distance: "2.3")
    ]
    
    lazy var items = Observable.just(self.locationInfos)
    
    private let disposedBag = DisposeBag()
    
    init() {
        let viewDidLoad = PublishRelay<()>()
        self.viewDidLoad = viewDidLoad
        
        let exhibitionInfo = PublishRelay<[ExhibitionLocationInfo]>()
        self.exhibitionInfo = exhibitionInfo.asSignal()
        
//        viewDidLoad
//            .subscribe(onNext: { [weak self] in
//                self?.loadNearByExhibitionInfo(info: exhibitionInfo)
//            })
//            .disposed(by: disposedBag)
    }
    
//    func loadNearByExhibitionInfo(info: PublishRelay<[ExhibitionLocationInfo]>) {
//        info.accept(locationInfos)
//    }
}
