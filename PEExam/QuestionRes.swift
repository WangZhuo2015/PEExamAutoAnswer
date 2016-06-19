//
//	QuestionRes.swift
//on 17/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct QuestionRes{
    
    var isSuccess : Bool!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        isSuccess = dictionary["isSuccess"] as? Bool
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        let dictionary = NSMutableDictionary()
        if isSuccess != nil{
            dictionary["isSuccess"] = isSuccess
        }
        return dictionary
    }
    
}