//
//  ViewController.swift
//  PEExam
//
//  Created by 王卓 on 16/6/16.
//  Copyright © 2016年 SherryTeam. All rights reserved.
//

import Cocoa
import Alamofire
class ViewController: NSViewController,AutoAnswerDelegate {

    @IBOutlet weak var shouldDelay: NSButton!
    
    @IBOutlet weak var passWordText: NSTextField!
    
    
    @IBOutlet var logArea: NSTextView!
    @IBOutlet weak var uidText: NSTextField!
    var model = Model.model
    override func viewDidLoad() {
        model.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func answerPaper(sender: NSButton) {
        model.delay = shouldDelay.state == 0
        let uid = uidText.stringValue
        let password = passWordText.stringValue
        Model.model.login(uid, password: password) {
            Model.model.getPaper(User.sharedUser.uid, token: User.sharedUser.token, completeHandle: { (data) in
                Model.model.startExam(User.sharedUser.uid, token: User.sharedUser.token, paperID: Model.model.paperID, completeHandle: { (data) in
                    Model.model.autoAnswer(User.sharedUser.token, uid: User.sharedUser.uid, paperID: Model.model.paperID, questionData: data)
                })
            })
        }
        
//        model.autoAnswer(token, uid: uid, paperID: String, questionData: model.decodeQuestionData(str!)!)
    }

    func printLog(log: String) {
        logArea.string = ((logArea.string) ?? "") + log + "\n"
    }
    func error() {
        fatalError()
    }
}

