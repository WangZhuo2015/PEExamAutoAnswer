//
//	ExamDataAPIBase.swift
// on 17/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct ExamDataAPIBase{

	var endTime : String!
	var examMinutes : Int!
	var examPaperId : Int!
	var examPaperName : String!
	var id : Int!
	var isAllowExam : Bool!
	var isDuring : Bool!
	var itemName : String!
	var message : String!
	var notices : String!
	var scores : Score!
	var startTime : String!
	var studentName : String!
	var studentSno : String!
	var subjectScore : Float!
	var totalSubCount : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		endTime = dictionary["endTime"] as? String
		examMinutes = dictionary["examMinutes"] as? Int
		examPaperId = dictionary["examPaperId"] as? Int
		examPaperName = dictionary["examPaperName"] as? String
		id = dictionary["id"] as? Int
		isAllowExam = dictionary["isAllowExam"] as? Bool
		isDuring = dictionary["isDuring"] as? Bool
		itemName = dictionary["itemName"] as? String
		message = dictionary["message"] as? String
		notices = dictionary["notices"] as? String
		if let scoresData = dictionary["scores"] as? NSDictionary{
				scores = Score(fromDictionary: scoresData)
			}
		startTime = dictionary["startTime"] as? String
		studentName = dictionary["studentName"] as? String
		studentSno = dictionary["studentSno"] as? String
		subjectScore = dictionary["subjectScore"] as? Float
		totalSubCount = dictionary["totalSubCount"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if endTime != nil{
			dictionary["endTime"] = endTime
		}
		if examMinutes != nil{
			dictionary["examMinutes"] = examMinutes
		}
		if examPaperId != nil{
			dictionary["examPaperId"] = examPaperId
		}
		if examPaperName != nil{
			dictionary["examPaperName"] = examPaperName
		}
		if id != nil{
			dictionary["id"] = id
		}
		if isAllowExam != nil{
			dictionary["isAllowExam"] = isAllowExam
		}
		if isDuring != nil{
			dictionary["isDuring"] = isDuring
		}
		if itemName != nil{
			dictionary["itemName"] = itemName
		}
		if message != nil{
			dictionary["message"] = message
		}
		if notices != nil{
			dictionary["notices"] = notices
		}
		if scores != nil{
			dictionary["scores"] = scores.toDictionary()
		}
		if startTime != nil{
			dictionary["startTime"] = startTime
		}
		if studentName != nil{
			dictionary["studentName"] = studentName
		}
		if studentSno != nil{
			dictionary["studentSno"] = studentSno
		}
		if subjectScore != nil{
			dictionary["subjectScore"] = subjectScore
		}
		if totalSubCount != nil{
			dictionary["totalSubCount"] = totalSubCount
		}
		return dictionary
	}

}