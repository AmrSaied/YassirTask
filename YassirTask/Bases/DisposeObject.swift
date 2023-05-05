//
//  DisposeObject.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import RxSwift

class DisposeObject {
    var deinitCalled: (() -> Void)?
    var disposeBag: DisposeBag
    
    init() {
        self.disposeBag = DisposeBag()
    }
    
    deinit {
        deinitCalled?()
    }
}
 
