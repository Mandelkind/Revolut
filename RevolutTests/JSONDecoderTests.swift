//
//  JSONDecoderTests.swift
//  RevolutTests
//
//  Created by Marco Betschart on 21.06.18.
//  Copyright © 2018 MANDELKIND. All rights reserved.
//

import XCTest
@testable import Revolut

class JSONDecoderTests: XCTestCase {
	
	func testTransactionCreatedEventTopupCompleted(){
		let json = "{\"event\":\"TransactionCreated\",\"timestamp\":\"2018-05-22T10:35:30.366Z\",\"data\":{\"id\":\"d19439cf-302d-4c82-91ca-0f112022303f\",\"type\":\"topup\",\"state\":\"completed\",\"created_at\":\"2018-05-22T10:35:30.373Z\",\"updated_at\":\"2018-05-22T10:35:30.373Z\",\"completed_at\":\"2018-05-22T10:35:30.374Z\",\"reference\":\"180522-0523\",\"legs\":[{\"leg_id\":\"56017e89-0641-44bb-9904-7fce73895e37\",\"account_id\":\"cd8f690d-b108-4cb7-a467-a62cbab218a7\",\"amount\":107.7,\"currency\":\"EUR\",\"description\":\"Payment from John Doe\"}]}}"
		let data = json.data(using: .utf8)
		XCTAssertNotNil(data)
		XCTAssertNoThrow(try Revolut.jsonDecoder.decode(TransactionCreatedEvent.self, from: data!))
	}
	
	func testTransactionCreatedEventCardPaymentPending(){
		let json = "{\"event\":\"TransactionCreated\",\"timestamp\":\"2018-05-24T08:16:24.466Z\",\"data\":{\"id\":\"154f3dae-4ff3-43d3-9070-f520a6f7af71\",\"type\":\"card_payment\",\"state\":\"pending\",\"created_at\":\"2018-05-24T08:16:24.516Z\",\"updated_at\":\"2018-05-24T08:16:24.516Z\",\"merchant\":{\"name\":\"Public Transport\",\"city\":\"Zuerich\",\"category_code\":\"4112\",\"country\":\"CHE\"},\"legs\":[{\"leg_id\":\"bacf386f-d946-4d28-8de9-c8410d0cd304\",\"account_id\":\"094f5086-b2fb-43da-ae7e-d7dfee30b34d\",\"amount\":-6.2,\"currency\":\"CHF\",\"description\":\"Payment from John Doe\"}],\"revertable\":true,\"card\":{\"card_number\":\"123456******1234\",\"first_name\":\"Jane\",\"last_name\":\"Doe\",\"phone\":\"+41712345678\"}}}"
		let data = json.data(using: .utf8)
		XCTAssertNotNil(data)
		XCTAssertNoThrow(try Revolut.jsonDecoder.decode(TransactionCreatedEvent.self, from: data!))
	}
	
	func testTransactionCreatedEventCardPaymentDeclinedVariantA(){
		let json = "{\"event\":\"TransactionCreated\",\"timestamp\":\"2018-05-22T20:44:55.226Z\",\"data\":{\"id\":\"571a7c0f-7aeb-414a-928f-7df219613b54\",\"type\":\"card_payment\",\"state\":\"declined\",\"reason_code\":\"INSUFFICIENT_BALANCE\",\"created_at\":\"2018-05-22T20:44:55.277Z\",\"updated_at\":\"2018-05-22T20:44:55.277Z\",\"merchant\":{\"name\":\"www.domain.tld\",\"city\":\"Crissier\",\"category_code\":\"4816\",\"country\":\"CHE\"},\"legs\":[{\"leg_id\":\"4712df7c-42f9-4f19-b69c-7b10efa5adce\",\"account_id\":\"094f5086-b2fb-43da-ae7e-d7dfee30b34d\",\"amount\":-827.92,\"currency\":\"USD\",\"description\":\"www.domain.tld\"}],\"card\":{\"card_number\":\"123456******1234\"}}}"
		let data = json.data(using: .utf8)
		XCTAssertNotNil(data)
		XCTAssertNoThrow(try Revolut.jsonDecoder.decode(TransactionCreatedEvent.self, from: data!))
	}
	
	func testTransactionCreatedEventCardPaymentDeclinedVariantB() {
		let json = "{\"event\":\"TransactionCreated\",\"timestamp\":\"2018-05-23T09:50:54.395Z\",\"data\":{\"id\":\"2bb8eb46-fe5f-43be-88e6-05e1e1c1cc62\",\"type\":\"card_payment\",\"state\":\"declined\",\"reason_code\":\"CARD_BLOCKED\",\"created_at\":\"2018-05-23T09:50:54.470Z\",\"updated_at\":\"2018-05-23T09:50:54.470Z\",\"merchant\":{\"name\":\"Wow Plan\",\"city\":\"8778877815\",\"category_code\":\"5734\",\"country\":\"DEU\"},\"legs\":[{\"leg_id\":\"41cfcc36-c2ba-421a-8ba6-1aaf5a7e6af4\",\"account_id\":\"cd8f690d-b108-4cb7-a467-a62cbab218a7\",\"amount\":-8.42,\"currency\":\"EUR\",\"bill_amount\":-9.86,\"bill_currency\":\"USD\",\"description\":\"Payment of Wow\"}],\"card\":{\"card_number\":\"123456******1234\"}}}"
		let data = json.data(using: .utf8)
		XCTAssertNotNil(data)
		XCTAssertNoThrow(try Revolut.jsonDecoder.decode(TransactionCreatedEvent.self, from: data!))
	}
	
	func testTransactionCreatedTransferToRevolutCompleted(){
		let json = "{\"event\":\"TransactionCreated\",\"timestamp\":\"2018-05-23T08:54:42.383Z\",\"data\":{\"id\":\"0f0c44bf-081a-4d73-95a7-d57edf117848\",\"type\":\"transfer\",\"state\":\"completed\",\"created_at\":\"2018-05-23T08:54:42.402Z\",\"updated_at\":\"2018-05-23T08:54:42.402Z\",\"completed_at\":\"2018-05-23T08:54:42.403Z\",\"reference\":\"iTunes 1/2\",\"legs\":[{\"leg_id\":\"f3acd3fc-9c8a-4de9-ab42-125b968a072d\",\"account_id\":\"cd8f690d-b108-4cb7-a467-a62cbab218a7\",\"counterparty\":{\"id\":\"1c222401-0e3c-45f7-aea4-2fd6047a91f8\",\"account_type\":\"revolut\",\"account_id\":\"027235d4-7c01-432c-87a9-73131d55ab81\"},\"amount\":-90,\"currency\":\"EUR\",\"description\":\"To John Doe\"}]}}"
		let data = json.data(using: .utf8)
		XCTAssertNotNil(data)
		XCTAssertNoThrow(try Revolut.jsonDecoder.decode(TransactionCreatedEvent.self, from: data!))
	}
	
	func testTransactionStateChangedFromPendingToDeclined(){
		let json = "{\"event\":\"TransactionStateChanged\",\"timestamp\":\"2018-05-22T20:44:55.226Z\",\"data\":{\"id\":\"571a7c0f-7aeb-414a-928f-7df219613b54\",\"old_state\":\"pending\",\"new_state\":\"declined\"}}"
		let data = json.data(using: .utf8)
		XCTAssertNotNil(data)
		XCTAssertNoThrow(try Revolut.jsonDecoder.decode(TransactionStateChangedEvent.self, from: data!))
	}
}
