//
//  ProgressDisplayer.swift
//  YassirTask
//
//  Created by Amr Saied on 04/05/2023.
// 

import RxSwift
import RxCocoa

protocol LoadingDisplayerProtocol {
    func showProgress(backgroundColor: UIColor, spinnerColor: UIColor)
    func hideProgress()
}

extension LoadingDisplayerProtocol where Self: BaseViewController {
    func bindLoadingIndicator(to status: BehaviorRelay<ViewModelState<BaseError>>) {
        status.subscribe { [weak self] status in
            guard let self = self else { return }
            status.element == .loading ? self.showProgress() : self.hideProgress()
        }.disposed(by: disposeBag)
    }
    
    func showProgress(
        backgroundColor: UIColor = UIColor.gray,
        spinnerColor: UIColor = UIColor.brown
    ) {
        ProgressHUD.colorAnimation = spinnerColor
        ProgressHUD.animationType = .multipleCirclePulse
        ProgressHUD.show()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = false
            self.navigationController?.view.isUserInteractionEnabled = false
        }
    }
    
    func hideProgress() {
        ProgressHUD.dismiss()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.view.isUserInteractionEnabled = true
            self.navigationController?.view.isUserInteractionEnabled = true
        }
    }
}
