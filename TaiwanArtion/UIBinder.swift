//
//  UIBinder.swift
//  TaiwanArtion
//
//  Created by Jhen Mu on 2022/12/12.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

extension Reactive where Base: UIView {
    public var isHidden: Binder<Bool> {
        return Binder(self.base) { view, hidden in
            view.isHidden = hidden
        }
    }
}


