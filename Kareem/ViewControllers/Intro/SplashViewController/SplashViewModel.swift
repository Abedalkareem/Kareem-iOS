//
//  SplashViewModel.swift
//  Kareem
//
//  Created by abedalkareem omreyh on 11/12/2019.
//  Copyright © 2019 abedalkareem. All rights reserved.
//

import RxCocoa
import RxSwift

class SplashViewModel: ViewModelType, Refreshable, Loadable, ErrorEmitable {

  // MARK: - Properties

  var status = PublishSubject<AppStatus>()
  var disposeBag = DisposeBag()

  var loading: Observable<Loading>!
  var loadingTrigger: AnyObserver<Loading>!
  var error: Observable<Error>!
  var errorTrigger: AnyObserver<Error>!
  var refresh: Observable<()>!
  var refreshTrigger: AnyObserver<()>!

  // MARK: - Private properties

  private var introServices: IntroServices

  // MARK: - init

  init(introServices: IntroServices) {
    self.introServices = introServices

    intTriggers()
    getAppConfig()
  }

  private func intTriggers() {
    let errorPublishSubject = PublishSubject<Error>()
    error = errorPublishSubject.asObservable()
    errorTrigger = errorPublishSubject.asObserver()

    let loadingPublishSubject = PublishSubject<Loading>()
    loading = loadingPublishSubject.asObservable()
    loadingTrigger = loadingPublishSubject.asObserver()

    let refreshPublishSubject = BehaviorSubject<Void>(value: ())
    refresh = refreshPublishSubject.asObservable()
    refreshTrigger = refreshPublishSubject.asObserver()
  }

  private func getAppConfig() {
    let config = introServices
      .getConfig()
      .emitErrorTo(errorTrigger)
      .catchError(loadingTrigger, value: .init(false, type: .fullScreen))

    refresh
      .emitTo(loadingTrigger, value: .init(true, type: .fullScreen))
      .flatMap({ config })
      .map({ $0.appStatus })
      .emitTo(loadingTrigger, value: .init(false, type: .fullScreen))
      .bind(to: status)
      .disposed(by: disposeBag)
  }

}
