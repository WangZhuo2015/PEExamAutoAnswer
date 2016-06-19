//
//	UserAPIBase.swift
// on 17/6/2016
//	Copyright © 2016. All rights reserved.
//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct UserAPIBase{

	var bindDto : BindDto!
	var isBindSchool : Bool!
	var isMasterMass : Bool!
	var loginStatus : Bool!
	var portalUserId : Int!
	var sno : String!
	var token : String!
	var uid : String!
	var userId : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let bindDtoData = dictionary["bindDto"] as? NSDictionary{
				bindDto = BindDto(fromDictionary: bindDtoData)
			}
		isBindSchool = dictionary["isBindSchool"] as? Bool
		isMasterMass = dictionary["isMasterMass"] as? Bool
		loginStatus = dictionary["loginStatus"] as? Bool
		portalUserId = dictionary["portalUserId"] as? Int
		sno = dictionary["sno"] as? String
		token = dictionary["token"] as? String
		uid = dictionary["uid"] as? String
		userId = dictionary["user_id"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
		if bindDto != nil{
			dictionary["bindDto"] = bindDto.toDictionary()
		}
		if isBindSchool != nil{
			dictionary["isBindSchool"] = isBindSchool
		}
		if isMasterMass != nil{
			dictionary["isMasterMass"] = isMasterMass
		}
		if loginStatus != nil{
			dictionary["loginStatus"] = loginStatus
		}
		if portalUserId != nil{
			dictionary["portalUserId"] = portalUserId
		}
		if sno != nil{
			dictionary["sno"] = sno
		}
		if token != nil{
			dictionary["token"] = token
		}
		if uid != nil{
			dictionary["uid"] = uid
		}
		if userId != nil{
			dictionary["user_id"] = userId
		}
		return dictionary
	}

}