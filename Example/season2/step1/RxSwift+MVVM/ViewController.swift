//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

//class Observable<T> {
//    private let task: (@escaping (T) -> Void) -> Void
//    
//    init(task: @escaping (@escaping (T) -> Void) -> Void) {
//        self.task = task
//    }
//    
//    func subscribe(_ f: @escaping (T) -> Void) {
//        task(f)
//    }
//}

class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }

    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }
    
    // 본체함수 (downloadJson) 이 끝나고 나서도 나중에 실행이 되게끔 해주는게 escaping
    
    
    // 비동기 작업 -> completion 같은 클로저가 아니라,  리턴값으로 전달하기 위해서 만들어진 util이 바로 RxSwift
<<<<<<< HEAD
    func downloadJson(_ url: String) -> Observable<String?> {   // Observable은 나중에 생기는 데이터
        return Observable.create { f in
            DispatchQueue.global().async {
                let url = URL(string: url)!
                let data = try! Data(contentsOf: url)
                let json = String(data: data, encoding: .utf8)
                DispatchQueue.main.async {
                    f.onNext(json)
                    f.onCompleted()
=======
    
    
    // Observable's Life cycle
    // 1. Create
    // 2. Subscribe
    // 3. onNext
    
    // ---- END ----
    // 4. onCompleted // onError
    // 5. Disposed
    
    func downloadJson(_ url: String) -> Observable<String> {   // Observable은 나중에 생기는 데이터
        //MARK: - 1. 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
        
        return Observable.create { emmiter in
            
            let url = URL(string: url)!
            let task = URLSession.shared.dataTask(with: url) { data, _, err in
                guard err == nil else {
                    emmiter.onError(err!)
                    return
>>>>>>> 08eac3a (zip)
                }
            }
            
            return Disposables.create()
        }
    }
    

    // MARK: SYNC

    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBAction func onLoad() {
        editView.text = ""
        self.setVisibleWithAnimation(self.activityIndicator, true)
        
<<<<<<< HEAD
        let disposable = downloadJson(MEMBER_LIST_URL)
            .subscribe { event in
                switch event {
                case .next(let json):
                    self.editView.text = json
                    self.setVisibleWithAnimation(self.activityIndicator, false)
                case .completed:
                    break
                case .error:
                    break
                }
            }
=======
        //MARK: - 2. Observable로 오는 데이터를 받아서 처리하는 방법
        let jsonObservable = downloadJson(MEMBER_LIST_URL)
        let helloObservable = Observable.just("Hello World")
        
        Observable.zip(jsonObservable, helloObservable) { $1 + "\n" + $0 }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { json in
                self.editView.text = json
                self.setVisibleWithAnimation(self.activityIndicator, false)
            })
        
>>>>>>> 08eac3a (zip)
        
//        disposable.dispose()
    }
}
