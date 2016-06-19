//
//  Model.swift
//  PEExam
//
//  Created by 王卓 on 16/6/17.
//  Copyright © 2016年 SherryTeam. All rights reserved.
//

import Foundation
import Alamofire
class Model {
    static let model = Model()
    var delegate: AutoAnswerDelegate?
    var paperID:Int = 0
    var delay = true
    func decodeQuestionData(data:String)->QuestionData?{
        do{
            let json = try NSJSONSerialization.JSONObjectWithData( data.dataUsingEncoding(NSUTF8StringEncoding)! , options: .MutableContainers) as! NSDictionary
            return QuestionData(fromDictionary: json)
        }catch{
            return nil
        }
    }
    
    func autoAnswer(token:String,uid:String,paperID:Int,questionData:QuestionData){
        var count = 1
        questionData.dtos.forEach { (item) in
            var answer = ""
            item.answers.forEach({ (item) in
                answer += item.optionValue + ","
            })
            answer = answer.substringToIndex(answer.endIndex.predecessor())
            let URL = "http://appsrv.ihodoo.com"+"/auth/exam/select/".stringByAppendingString("\(paperID)").stringByAppendingString("/\(item.subId)").stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
            
            let time: NSTimeInterval = 2.0
            let delay = dispatch_time(DISPATCH_TIME_NOW,
                Int64(time * Double(NSEC_PER_SEC)))*UInt64(random()%10)
            if self.delay{
                dispatch_after(delay, dispatch_get_main_queue()) {
                    Alamofire.Manager.sharedInstance.request(.GET,URL, parameters: ["selectOptions":answer,"token":token,"uid":uid], encoding: .URL, headers: [:])
                        .validate(statusCode: 200...300).responseJSON(completionHandler: { (response) in
                            self.delegate?.printLog(String(data: response.data!, encoding: NSUTF8StringEncoding)!)
                            let json = try! NSJSONSerialization.JSONObjectWithData( response.data!, options: .MutableContainers) as! NSDictionary
                            guard QuestionRes(fromDictionary: json).isSuccess! else{
                                self.delegate?.printLog("提交失败")
                                return
                            }
                            self.delegate?.printLog("已经提交了\(count)题")
                            if count == 50{
                                self.submit(token,uid: uid,paperID: paperID)
                            }
                            count += 1
                        })
                }
            }else{
            Alamofire.Manager.sharedInstance.request(.GET,URL, parameters: ["selectOptions":answer,"token":token,"uid":uid], encoding: .URL, headers: [:])
                .validate(statusCode: 200...300).responseJSON(completionHandler: { (response) in
                    self.delegate?.printLog(String(data: response.data!, encoding: NSUTF8StringEncoding)!)
                    let json = try! NSJSONSerialization.JSONObjectWithData( response.data!, options: .MutableContainers) as! NSDictionary
                    guard QuestionRes(fromDictionary: json).isSuccess! else{
                        self.delegate?.printLog("提交失败")
                        return
                    }
                    self.delegate?.printLog("已经提交了\(count)题")
                    if count == 50{
                        self.submit(token,uid: uid,paperID: paperID)
                    }
                    count += 1
                })
            }
            self.delegate?.printLog("第\(count)题的答案是:")
            self.delegate?.printLog(answer)
        }
    }
    
    func submit(token:String,uid:String,paperID:Int){
        let URL = "http://appsrv.ihodoo.com/auth/exam/submit/\(paperID)".stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        Alamofire.Manager.sharedInstance.request(.GET, URL, parameters: ["token":token,"uid":uid], encoding: .URL, headers: [:]).responseJSON(completionHandler: { (response) in
            do{
                let json = try NSJSONSerialization.JSONObjectWithData( response.data! , options: .MutableContainers) as! NSDictionary
                let result = ExamRes(fromDictionary: json)
                print("分数\(result.score)")
                print("排名\(result.rankMessage)")
                self.delegate?.printLog("分数\(result.score)")
                self.delegate?.printLog("排名\(result.rankMessage)")
            }catch{
                //self.delegate?.printLog(error)
                self.delegate?.printLog(response.description)
                self.delegate?.error()
            }
        })
    }
    
    func login(uid:String,password:String,completeHandle:()->Void){
        let URL = "http://appsrv.ihodoo.com/login"
        Alamofire.Manager.sharedInstance.request(.POST, URL, parameters: ["username":uid,"password":password], encoding: .URL, headers: [:]).responseJSON(completionHandler: { (response) in
            do{
                guard response.result.isSuccess else{
                    self.delegate?.printLog("账号或密码错误")
                    return
                }
                let json = try NSJSONSerialization.JSONObjectWithData( response.data! , options: .MutableContainers) as! NSDictionary
                let result = UserAPIBase(fromDictionary: json)
                print("token\(result.token)")
                print("uid\(result.uid)")
                User.sharedUser.token = result.token
                User.sharedUser.uid = result.uid
                completeHandle()
            }catch{
                self.delegate?.printLog("账号或密码错误")
                return
            }
        })
    }
    
    //    GET /auth/exam/enterIndex?token=a994e10e-465a-4169-82ae-062e3414dd7d&uid=
    //    HTTP/1.1
    //    Host: appsrv.ihodoo.com
    //    Accept-Encoding: gzip, deflate
    //    Accept: */*
    // Accept-Language: zh-Hans-US;q=1, en;q=0.9
    // Connection: keep-alive
    // User-Agent: hdxm/1 (iPhone; iOS 10.0; Scale/2.00)
    
    func getPaper(uid:String,token:String,completeHandle:(data:ExamDataAPIBase)->Void){
        let URL = "http://appsrv.ihodoo.com/auth/exam/enterIndex"
        Alamofire.Manager.sharedInstance.request(.GET, URL, parameters: ["token":token,"uid":uid], encoding: .URL, headers: [:]).responseJSON { (response) in
            do{
                let json = try NSJSONSerialization.JSONObjectWithData( response.data! , options: .MutableContainers) as! NSDictionary
                let result = ExamDataAPIBase(fromDictionary: json)
                self.paperID = result.examPaperId
                completeHandle(data: result)
            }catch{
                print("error")
                fatalError()
            }
        }
    }
    
    
    //    GET /auth/exam/start/10/338880?token=89532dc4-35d0-4464-a89e-982eef21e0c8&totalCount=50&uid= HTTP/1.1
    //    token	89532dc4-35d0-4464-a89e-982eef21e0c8
    //    totalCount	50
    //    uid	手机号
    //开始考试
    func startExam(uid:String,token:String,paperID:Int,completeHandle:(data:QuestionData)->Void){
        let URL = "http://appsrv.ihodoo.com/auth/exam/start/10/".stringByAppendingString("\(paperID)")
        Alamofire.Manager.sharedInstance.request(.GET, URL, parameters: ["token":token,"uid":uid,"totalCount":50], encoding: .URL, headers: [:]).responseJSON(completionHandler: { (response) in
            do{
                let json = try NSJSONSerialization.JSONObjectWithData( response.data! , options: .MutableContainers) as! NSDictionary
                let result = QuestionData(fromDictionary: json)
                completeHandle(data: result)
            }catch{
                print("error")
                fatalError()
            }
        })
    }
}
protocol AutoAnswerDelegate {
    func printLog(log: String)
    func error()
}