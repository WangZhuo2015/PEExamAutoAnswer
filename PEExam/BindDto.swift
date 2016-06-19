//
//	BindDto.swift
// on 17/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct BindDto{

	var currentAdclassId : Int!
	var currentAdclassName : String!
	var name : String!
	var school : School!
	var schoolId : Int!
	var schoolName : String!
	var sno : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		currentAdclassId = dictionary["currentAdclassId"] as? Int
		currentAdclassName = dictionary["currentAdclassName"] as? String
		name = dictionary["name"] as? String
		if let schoolData = dictionary["school"] as? NSDictionary{
				school = School(fromDictionary: schoolData)
			}
		schoolId = dictionary["schoolId"] as? Int
		schoolName = dictionary["schoolName"] as? String
		sno = dictionary["sno"] as? String
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if currentAdclassId != nil{
			dictionary["currentAdclassId"] = currentAdclassId
		}
		if currentAdclassName != nil{
			dictionary["currentAdclassName"] = currentAdclassName
		}
		if name != nil{
			dictionary["name"] = name
		}
		if school != nil{
			dictionary["school"] = school.toDictionary()
		}
		if schoolId != nil{
			dictionary["schoolId"] = schoolId
		}
		if schoolName != nil{
			dictionary["schoolName"] = schoolName
		}
		if sno != nil{
			dictionary["sno"] = sno
		}
		return dictionary
	}

}