//
//  BaseViewController.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
//

import UIKit
import RxSwift
class BaseViewController: UIViewController {
 
    var disposeBag = DisposeBag()
    
    deinit {
        print("deinit ", self.self)
    }

}
