//
//  BaseViewModel.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import RxSwift
import RxRelay

class BaseViewModel: DisposeObject {
    var stateRelay = BehaviorRelay<ViewModelState<BaseError>>.init(value: .idle)
    var alertItemRelay = BehaviorRelay<AlertItem?>.init(value: nil)
}
 
