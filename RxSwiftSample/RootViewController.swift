//
//  RootViewController.swift
//  RxSwiftSample
//
//  Created by Tomoyuki Ito on 2018/04/23.
//  Copyright © 2018 Nagisa Inc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RootViewController: UIViewController {

    @IBOutlet weak var label: UILabel!

    let subject = PublishSubject<Int>.interval(1, scheduler: MainScheduler.instance)
    private let disposeBag = DisposeBag()

    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        subject.subscribe(
            onNext: { [unowned self] num in
                self.count += 1
                self.label.text = String(self.count)
            }
        ).disposed(by: self.disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
