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
    var searchModeIsHidden: Signal<Bool> { get }
}

protocol NearByExhibitionViewModelType {
    var inputs: NearByExhibitionViewModelInput { get }
    var outputs: NearByExhibitionViewModelOutput { get }
}

class NearbyExhibitionViewModel: NearByExhibitionViewModelInput, NearByExhibitionViewModelOutput, NearByExhibitionViewModelType {
    
    public var viewDidLoad: PublishRelay<()>
    
    public var searchModeIsHidden: Signal<Bool>
    
    public var inputs: NearByExhibitionViewModelInput { self }
    
    public var outputs: NearByExhibitionViewModelOutput { self }
    
    private let disposedBag = DisposeBag()
    
    init() {
        let viewDidLoad = PublishRelay<()>()
        self.viewDidLoad = viewDidLoad
        
        let searchModeIsHidden = PublishRelay<Bool>()
        self.searchModeIsHidden = searchModeIsHidden.asSignal()
        
        viewDidLoad
            .subscribe(onNext: { [weak self] in
//                self?.searchModeIsHidden
            })
            .disposed(by: disposedBag)
    }
    
}
