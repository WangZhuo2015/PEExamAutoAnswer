//
//  data.swift
//  答案解析
//
//  Created by 王卓 on 16/6/16.
//  Copyright © 2016年 SherryTeam. All rights reserved.
//

import Foundation
struct QuestionData{
    
    var dtos : [Dto]!
    var isSuccess : Bool!
    var message : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        dtos = [Dto]()
        if let dtosArray = dictionary["dtos"] as? [NSDictionary]{
            for dic in dtosArray{
                let value = Dto(fromDictionary: dic)
                dtos.append(value)
            }
        }
        isSuccess = dictionary["isSuccess"] as? Bool
        message = dictionary["message"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if dtos != nil{
            var dictionaryElements = [NSDictionary]()
            for dtosElement in dtos {
                dictionaryElements.append(dtosElement.toDictionary())
            }
            dictionary["dtos"] = dictionaryElements
        }
        if isSuccess != nil{
            dictionary["isSuccess"] = isSuccess
        }
        if message != nil{
            dictionary["message"] = message
        }
        return dictionary
    }
    
}


struct Dto{
    
    var answers : [Answer]!
    var isMarked : Bool!
    var options : [Option]!
    var selects : [AnyObject]!
    var sort : Int!
    var subId : Int!
    var subName : String!
    var totalCount : Int!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        answers = [Answer]()
        if let answersArray = dictionary["answers"] as? [NSDictionary]{
            for dic in answersArray{
                let value = Answer(fromDictionary: dic)
                answers.append(value)
            }
        }
        isMarked = dictionary["isMarked"] as? Bool
        options = [Option]()
        if let optionsArray = dictionary["options"] as? [NSDictionary]{
            for dic in optionsArray{
                let value = Option(fromDictionary: dic)
                options.append(value)
            }
        }
        selects = dictionary["selects"] as? [AnyObject]
        sort = dictionary["sort"] as? Int
        subId = dictionary["subId"] as? Int
        subName = dictionary["subName"] as? String
        totalCount = dictionary["totalCount"] as? Int
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if answers != nil{
            var dictionaryElements = [NSDictionary]()
            for answersElement in answers {
                dictionaryElements.append(answersElement.toDictionary())
            }
            dictionary["answers"] = dictionaryElements
        }
        if isMarked != nil{
            dictionary["isMarked"] = isMarked
        }
        if options != nil{
            var dictionaryElements = [NSDictionary]()
            for optionsElement in options {
                dictionaryElements.append(optionsElement.toDictionary())
            }
            dictionary["options"] = dictionaryElements
        }
        if selects != nil{
            dictionary["selects"] = selects
        }
        if sort != nil{
            dictionary["sort"] = sort
        }
        if subId != nil{
            dictionary["subId"] = subId
        }
        if subName != nil{
            dictionary["subName"] = subName
        }
        if totalCount != nil{
            dictionary["totalCount"] = totalCount
        }
        return dictionary
    }
    
}


struct Option{
    
    var id : Int!
    var optLabel : String!
    var optValue : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        id = dictionary["id"] as? Int
        optLabel = dictionary["optLabel"] as? String
        optValue = dictionary["optValue"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if id != nil{
            dictionary["id"] = id
        }
        if optLabel != nil{
            dictionary["optLabel"] = optLabel
        }
        if optValue != nil{
            dictionary["optValue"] = optValue
        }
        return dictionary
    }
    
}

struct Answer{
    
    var optionValue : String!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        optionValue = dictionary["optionValue"] as? String
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if optionValue != nil{
            dictionary["optionValue"] = optionValue
        }
        return dictionary
    }
    
}
