//
//	ExamRes.swift
// on 17/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ExamRes{

	var isSuccess : Bool!
	var message : String!
	var rankMessage : String!
	var score : Float!
	var scoreRank : Int!
	var times : Int!
	var totalRank : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		isSuccess = dictionary["isSuccess"] as? Bool
		message = dictionary["message"] as? String
		rankMessage = dictionary["rankMessage"] as? String
		score = dictionary["score"] as? Float
		scoreRank = dictionary["scoreRank"] as? Int
		times = dictionary["times"] as? Int
		totalRank = dictionary["totalRank"] as? Int
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
		if message != nil{
			dictionary["message"] = message
		}
		if rankMessage != nil{
			dictionary["rankMessage"] = rankMessage
		}
		if score != nil{
			dictionary["score"] = score
		}
		if scoreRank != nil{
			dictionary["scoreRank"] = scoreRank
		}
		if times != nil{
			dictionary["times"] = times
		}
		if totalRank != nil{
			dictionary["totalRank"] = totalRank
		}
		return dictionary
	}

}