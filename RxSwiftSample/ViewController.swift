//
//  ViewController.swift
//  RxSwiftSample
//
//  Created by Tomoyuki Ito on 2018/04/23.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    private let disposeBag = DisposeBag()

    deinit {
        print(type(of: self).description() + " " + #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.textField.rx.text.orEmpty
//            .throttle(1.0, scheduler: MainScheduler.instance)
//            .distinctUntilChanged()
//            .subscribe(onNext: { [unowned self] text in
//                self.label.text = text
//            })
//            .disposed(by: self.disposeBag)
        
        self.textField.rx.text.orEmpty.subscribe(
            onNext: { [unowned self] text in
                self.label.text = text
            }
        ).disposed(by: self.disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

