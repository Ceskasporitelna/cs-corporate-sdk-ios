//
//  CSCorporateSDKTests.swift
//  CSCorporateSDKTests
//
//  Created by Vladimír Nevyhoštěný on 19/08/2017.
//  Copyright © 2017 Applifting. All rights reserved.
//

import XCTest
import CSCoreSDK

@testable import CSCorporateSDK

//==============================================================================
class CSCorporateSDKTests: XCTestCase
{
    var client:           CorporateSDKClient!
    var judgeSession:     JudgeSession!
    
    var dateFormatter       = DateFormatter()
    var dateTimeFormatter   = DateFormatter()
    
    //--------------------------------------------------------------------------
    override func setUp()
    {
        super.setUp()
        
        let config                        = WebApiConfiguration(webApiKey: "TEST_API_KEY", environment: Environment(apiContextBaseUrl: Judge.BaseURL + "/webapi", oAuth2ContextBaseUrl: ""), language: "cs-CZ", signingKey: nil)
        self.judgeSession                 = Judge.startNewSession()
        self.client                       = CorporateSDKClient(config: config)
        
        self.dateFormatter.dateFormat     = CSCorporateSDK.DateFormat
        self.dateTimeFormatter.dateFormat = CSCorporateSDK.DateTimeFormat
        
    }
    
    //--------------------------------------------------------------------------
    override func tearDown()
    {
        super.tearDown()
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesList()
    {
        self.judgeSession.setNextCase( "corporate.companies.list", xcTestCase: self)
        
        let expectation                = self.expectation(description: "Response expectation")
        
        self.client.companies.list { result in
            switch (result) {
            case .success(let companiesList):
                for index in 0..<companiesList.items.count {
                    let company = companiesList.items [index]
                    switch index {
                    case 0:
                        XCTAssertEqual(company.regNum, "44366281")
                        XCTAssertEqual(company.legalForm, "101")
                        XCTAssertEqual(company.legalFormI18N, "Pod.FO tuz.nezaps.OR")
                        XCTAssertEqual(company.name, "Kateřina Vávrová")
                        
                        XCTAssertEqual(company.companyProfile?.cnbType, "440")
                        XCTAssertEqual(company.companyProfile?.cnbTypeI18N, "Fyzická osoba")
                        XCTAssertEqual(company.companyProfile?.industryCategory, "855900")
                        XCTAssertEqual(company.companyProfile?.industryCategoryI18N, "Ostatní vzdělávání j. n.")
                        XCTAssertEqual(company.companyProfile?.sector, "1420000")
                        XCTAssertEqual(company.companyProfile?.sectorI18N, "1420000_OSTATNÍ OSOBY SAM. V.Č")
                        
                        XCTAssertEqual(company.relationshipType?.relationshipType, "AA")
                        XCTAssertEqual(company.relationshipType?.relationshipTypeI18N, "Vazba FO/FOp dle RČ-jednoznačná")
                        
                    case 1:
                        XCTAssertEqual(company.regNum, "49624911")
                        XCTAssertEqual(company.legalForm, "331")
                        XCTAssertEqual(company.legalFormI18N, "Přísp. org. zř. úz.sam.cel")
                        XCTAssertEqual(company.name, "ZÁKLADNÍ ŠKOLA S ROZŠÍŘENOU VÝUKOU JAZYKŮ FAKULTNÍ ŠKOLA PF UK PRAHA 2 KLADSKÁ 1")
                        
                        XCTAssertEqual(company.companyProfile?.industryCategory, "853110")
                        XCTAssertEqual(company.companyProfile?.industryCategoryI18N, "Sekundární všeobecné vzdělávání")
                        XCTAssertEqual(company.companyProfile?.sector, "1313000")
                        XCTAssertEqual(company.companyProfile?.sectorI18N, "1313000_MÍSTNÍ VLÁD. INSTIT.")
                        
                        XCTAssertEqual(company.relationshipType?.relationshipType, "25")
                        XCTAssertEqual(company.relationshipType?.relationshipTypeI18N, "Statutární orgán 2. kl.")
                        
                    case 2:
                        XCTAssertEqual(company.regNum, "49624911")
                        XCTAssertEqual(company.taxNum, "CZ49624911")
                        XCTAssertEqual(company.legalForm, "331")
                        XCTAssertEqual(company.legalFormI18N, "Přísp. org. zř. úz.sam.cel")
                        XCTAssertEqual(company.name, "ZÁKLADNÍ ŠKOLA.FAKULTNÍ ŠKOLA PEDAGOGICKÉ FAKULTY UK")
                        
                        XCTAssertEqual(company.companyProfile?.cnbType, "180")
                        XCTAssertEqual(company.companyProfile?.cnbTypeI18N, "Příspěvkové a jiné organiz. v působ. územních samospr. celků")
                        XCTAssertEqual(company.companyProfile?.industryCategory, "853110")
                        XCTAssertEqual(company.companyProfile?.industryCategoryI18N, "Sekundární všeobecné vzdělávání")
                        XCTAssertEqual(company.companyProfile?.sector, "1313000")
                        XCTAssertEqual(company.companyProfile?.sectorI18N, "1313000_MÍSTNÍ VLÁD. INSTIT.")
                        
                        XCTAssertEqual(company.relationshipType?.relationshipType, "47")
                        XCTAssertEqual(company.relationshipType?.relationshipTypeI18N, "Řídící osoba")
                        
                    case 3:
                        XCTAssertEqual(company.regNum, "70943141")
                        XCTAssertEqual(company.legalForm, "331")
                        XCTAssertEqual(company.legalFormI18N, "Přísp. org. zř. úz.sam.cel")
                        XCTAssertEqual(company.name, "ZÁKLADNÍ ŠKOLA JANA HUSA PÍSEK HUSOVO NÁMĚSTÍ 725")
                        
                        XCTAssertEqual(company.companyProfile?.industryCategory, "853110")
                        XCTAssertEqual(company.companyProfile?.industryCategoryI18N, "Sekundární všeobecné vzdělávání")
                        XCTAssertEqual(company.companyProfile?.sector, "1313000")
                        XCTAssertEqual(company.companyProfile?.sectorI18N, "1313000_MÍSTNÍ VLÁD. INSTIT.")
                        
                        XCTAssertEqual(company.relationshipType?.relationshipType, "47")
                        XCTAssertEqual(company.relationshipType?.relationshipTypeI18N, "Řídící osoba")
                        
                    case 4:
                        XCTAssertEqual(company.regNum, "49624911")
                        XCTAssertEqual(company.legalForm, "331")
                        XCTAssertEqual(company.legalFormI18N, "Přísp. org. zř. úz.sam.cel")
                        XCTAssertEqual(company.name, "ZÁKLADNÍ ŠKOLA S ROZŠÍŘENOU VÝUKOU JAZYKŮ FAKULTNÍ ŠKOLA PF UK PRAHA 2 KLADSKÁ 1")
                        
                        XCTAssertEqual(company.companyProfile?.industryCategory, "853110")
                        XCTAssertEqual(company.companyProfile?.industryCategoryI18N, "Sekundární všeobecné vzdělávání")
                        XCTAssertEqual(company.companyProfile?.sector, "1313000")
                        XCTAssertEqual(company.companyProfile?.sectorI18N, "1313000_MÍSTNÍ VLÁD. INSTIT.")
                        
                        XCTAssertEqual(company.relationshipType?.relationshipType, "47")
                        XCTAssertEqual(company.relationshipType?.relationshipTypeI18N, "Řídící osoba")
                        
                    default:
                        XCTFail("Unexpected count of companiesList items!")
                    }
                }
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesGetSimple()
    {
        self.judgeSession.setNextCase( "corporate.companies.get.simple", xcTestCase: self)
        
        let expectation                = self.expectation(description: "Response expectation")
        
        self.client.companies.withId("49624911").get { result in
            switch result {
            case .success(let company):
                XCTAssertEqual(company.regNum, "49624911")
                XCTAssertEqual(company.taxNum, "CZ49624911")
                XCTAssertEqual(company.legalForm, "331")
                XCTAssertEqual(company.legalFormI18N, "Přísp. org. zř. úz.sam.cel")
                XCTAssertEqual(company.name, "ZÁKLADNÍ ŠKOLA.FAKULTNÍ ŠKOLA PEDAGOGICKÉ FAKULTY UK")
                
                XCTAssertEqual(company.companyProfile?.cnbType, "180")
                XCTAssertEqual(company.companyProfile?.cnbTypeI18N, "Příspěvkové a jiné organiz. v působ. územních samospr. celků")
                XCTAssertEqual(company.companyProfile?.industryCategory, "853110")
                XCTAssertEqual(company.companyProfile?.industryCategoryI18N, "Sekundární všeobecné vzdělávání")
                XCTAssertEqual(company.companyProfile?.sector, "1313000")
                XCTAssertEqual(company.companyProfile?.sectorI18N, "1313000_MÍSTNÍ VLÁD. INSTIT.")
                
                XCTAssertEqual(company.relationshipType?.relationshipType, "47")
                XCTAssertEqual(company.relationshipType?.relationshipTypeI18N, "Řídící osoba")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesCampaignsList()
    {
        self.judgeSession.setNextCase( "corporate.companies.campaigns.list", xcTestCase: self)
        
        let expectation                = self.expectation(description: "Response expectation")
        
        self.client.companies.withId("321").campaigns.list { result in
            switch (result) {
            case .success(let campaignsList):
                for index in 0..<campaignsList.items.count {
                    let campaign = campaignsList.items [index]
                    switch index {
                    case 0:
                        XCTAssertEqual(campaign.id, 123)
                        XCTAssertEqual(campaign.name, "Campaign")
                        XCTAssertEqual(campaign.endDate, self.dateTimeFormatter.date(from: "2014-11-26T00:00:00+01:00" )  )
                        XCTAssertEqual(campaign.channel, "ATM")
                        XCTAssertEqual(campaign.comment, "Campaign comment")
                        XCTAssertEqual(campaign.targetListId, 111)
                        
                    default:
                        XCTFail("Unexpected count of campaignsList items!")
                    }
                }
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateAccountsList()
    {
        self.judgeSession.setNextCase( "corporate.accounts.list", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        let params      = AccountsParameters(pagination: Pagination(pageNumber:0, pageSize:1))
        
        self.client.accounts.list(params) { result in
            switch (result) {
            case .success(let accountList):
                for index in 0..<accountList.items.count {
                    let account = accountList.items [index]
                    switch index {
                    case 0:
                        XCTAssertEqual(account.id, "3520EE975815E478AFED5180CC32647934720EF5")
                        
                        XCTAssertEqual(account.accountNo?.accountNumber, "4630309")
                        XCTAssertEqual(account.accountNo?.accountPrefix, "0")
                        XCTAssertEqual(account.accountNo?.bankCode, "800")
                        XCTAssertEqual(account.accountNo?.bic, "GIBACZPX")
                        XCTAssertEqual(account.accountNo?.iban, "CZ7108000000000004630309")
                        
                        XCTAssertEqual(account.accountType.value, "C")
                        XCTAssertEqual(account.currency.value, "CZK")
                        
                        XCTAssertEqual(account.accountOwner.company?.name, "Základní škola s rozšířenou výukou jazyků, Fakultní škola Pedagogické fakulty UK, Praha 2, Kladská 1")
                        XCTAssertEqual(account.accountOwner.company?.regNum, "49624911")
                        
                    default:
                        XCTFail("Unexpected count of accountList items!")
                    }
                }
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateAccountsListPagination()
    {
        self.judgeSession.setNextCase( "corporate.accounts.list.pagination", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.list(AccountsParameters(pagination: Pagination(pageNumber:0, pageSize:1))) { result in
            switch (result) {
            case .success(let accountList):
                XCTAssertEqual(accountList.items.count, 1)
                
                let account = accountList.items [0]
                XCTAssertEqual(account.id, "3520EE975815E478AFED5180CC32647934720EF5")
                
                XCTAssertEqual(account.accountNo?.accountNumber, "4630309")
                XCTAssertEqual(account.accountNo?.accountPrefix, "0")
                XCTAssertEqual(account.accountNo?.bankCode, "800")
                XCTAssertEqual(account.accountNo?.bic, "GIBACZPX")
                XCTAssertEqual(account.accountNo?.iban, "CZ7108000000000004630309")
                
                XCTAssertEqual(account.accountType.value, "C")
                XCTAssertEqual(account.currency.value, "CZK")
                
                XCTAssertEqual(account.accountOwner.company?.name, "Základní škola s rozšířenou výukou jazyků, Fakultní škola Pedagogické fakulty UK, Praha 2, Kladská 1")
                XCTAssertEqual(account.accountOwner.company?.regNum, "49624911")
                
                self.client.accounts.list(AccountsParameters(pagination: Pagination(pageNumber:1, pageSize:1))) { result in
                    switch result {
                    case .success(let accountList):
                        XCTAssertEqual(accountList.items.count, 1)
                        
                        let account = accountList.items [0]
                        XCTAssertEqual(account.id, "CCA4F9863D686D04")
                        
                        XCTAssertEqual(account.accountNo?.accountNumber, "123456789")
                        XCTAssertEqual(account.accountNo?.accountPrefix, "17")
                        XCTAssertEqual(account.accountNo?.bankCode, "0800")
                        XCTAssertEqual(account.accountNo?.bic, "GIBACZPX")
                        XCTAssertEqual(account.accountNo?.iban, "CZ2908000000002812275553")
                        
                        XCTAssertEqual(account.accountType.value, "S")
                        XCTAssertEqual(account.accountName, "Úspory")
                        XCTAssertEqual(account.currency.value, "CZK")
                        
                        XCTAssertEqual(account.accountOwner.company?.name, "ČEZ a.s.")
                        XCTAssertEqual(account.accountOwner.company?.regNum, "45274649")
                        
                        expectation.fulfill()
                        
                    case .failure(let error):
                        XCTFail("Test failed with error: \(error.localizedDescription)")
                    }
                    
                }
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateAccountsBalance()
    {
        self.judgeSession.setNextCase( "corporate.accounts.balance", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.accounts.withId("3520EE975815E478AFED5180CC32647934720EF5").balance.get { result in
            switch result {
            case .success(let accountBalance):
                XCTAssertEqual(accountBalance.balance?.value, 21828327)
                XCTAssertEqual(accountBalance.balance?.precision, 2)
                XCTAssertEqual(accountBalance.balance?.currency.value, "CZK")
                
                XCTAssertEqual(accountBalance.disposable?.value, 21728327)
                XCTAssertEqual(accountBalance.disposable?.precision, 2)
                XCTAssertEqual(accountBalance.disposable?.currency.value, "CZK")
                
                XCTAssertEqual(accountBalance.minBalance, 1000)
                
                XCTAssertEqual(accountBalance.overdraft?.value, 0)
                XCTAssertEqual(accountBalance.overdraft?.precision, 2)
                XCTAssertEqual(accountBalance.overdraft?.currency.value, "CZK")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
                
            }
        }
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateAccountsTransactionsList()
    {
        self.judgeSession.setNextCase( "corporate.accounts.transactions.list", xcTestCase: self)
        
        let expectation      = self.expectation(description: "Response expectation")
        let formatter        = DateFormatter()
        formatter.dateFormat = CSCorporateSDK.DateTimeFormat
        let params           = TransactionsParameters(pagination: Pagination(pageNumber:0, pageSize:1), dateStart: formatter.date(from: "2016-06-01T00:00:00+01:00"), dateEnd: formatter.date(from: "2016-06-01T00:00:00+01:00"))
        
        self.client.accounts.withId("3520EE975815E478AFED5180CC32647934720EF5").transactions.list(params) { result in
            switch (result) {
            case .success(let transactionsList):
                XCTAssertEqual(transactionsList.items.count, 1)
                let accountTransaction = transactionsList.items [0]
                
                XCTAssertEqual(accountTransaction.transactionId, "201606200000795231001001")
                
                XCTAssertEqual(accountTransaction.accountParty?.accountNumber, "223149101")
                XCTAssertEqual(accountTransaction.accountParty?.bankCode, "0100")
                
                XCTAssertEqual(accountTransaction.amount?.value, -153780)
                XCTAssertEqual(accountTransaction.amount?.precision, 2)
                XCTAssertEqual(accountTransaction.amount?.currency.value, "CZK")
                
                XCTAssertEqual(accountTransaction.amountSender?.value, -153780)
                XCTAssertEqual(accountTransaction.amountSender?.precision, 2)
                XCTAssertEqual(accountTransaction.amountSender?.currency.value, "CZK")
                
                XCTAssertEqual(accountTransaction.bookingDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                XCTAssertEqual(accountTransaction.constantSymbol, "0008")
                XCTAssertEqual(accountTransaction.description, "D.platba - S24/TB/GSM/B24")
                XCTAssertEqual(accountTransaction.payerNote, "Vorlík zelenina - ovoce ")
                XCTAssertEqual(accountTransaction.transactionType, "93504")
                XCTAssertEqual(accountTransaction.transactionTypeI18N, "D.platba - S24/TB/GSM/B24")
                XCTAssertEqual(accountTransaction.valuationDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                XCTAssertEqual(accountTransaction.variableSymbol, "16273")
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateAccountsTransactionsListPagination()
    {
        self.judgeSession.setNextCase( "corporate.accounts.transactions.list.pagination", xcTestCase: self)
        
        let expectation      = self.expectation(description: "Response expectation")
        
        let formatter        = DateFormatter()
        formatter.dateFormat = CSCorporateSDK.DateTimeFormat
        
        let dateStart        = formatter.date(from: "2016-06-01T00:00:00+01:00")
        let dateEnd          = formatter.date(from: "2016-06-01T00:00:00+01:00")
        
        var params           = TransactionsParameters(pagination: Pagination(pageNumber:0, pageSize:1), dateStart: dateStart, dateEnd: dateEnd)
        
        self.client.accounts.withId("3520EE975815E478AFED5180CC32647934720EF5").transactions.list(params) { result in
            switch (result) {
            case .success(let transactionsList):
                XCTAssertEqual(transactionsList.items.count, 1)
                let accountTransaction = transactionsList.items [0]
                
                XCTAssertEqual(accountTransaction.transactionId, "201606200000795231001001")
                
                XCTAssertEqual(accountTransaction.accountParty?.accountNumber, "223149101")
                XCTAssertEqual(accountTransaction.accountParty?.bankCode, "0100")
                
                XCTAssertEqual(accountTransaction.amount?.value, -153780)
                XCTAssertEqual(accountTransaction.amount?.precision, 2)
                XCTAssertEqual(accountTransaction.amount?.currency.value, "CZK")
                
                XCTAssertEqual(accountTransaction.amountSender?.value, -153780)
                XCTAssertEqual(accountTransaction.amountSender?.precision, 2)
                XCTAssertEqual(accountTransaction.amountSender?.currency.value, "CZK")
                
                XCTAssertEqual(accountTransaction.bookingDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                XCTAssertEqual(accountTransaction.constantSymbol, "0008")
                XCTAssertEqual(accountTransaction.description, "D.platba - S24/TB/GSM/B24")
                XCTAssertEqual(accountTransaction.payerNote, "Vorlík zelenina - ovoce ")
                XCTAssertEqual(accountTransaction.transactionType, "93504")
                XCTAssertEqual(accountTransaction.transactionTypeI18N, "D.platba - S24/TB/GSM/B24")
                XCTAssertEqual(accountTransaction.valuationDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                XCTAssertEqual(accountTransaction.variableSymbol, "16273")
                
                params = TransactionsParameters(pagination: Pagination(pageNumber:1, pageSize:1), dateStart: dateStart, dateEnd: dateEnd)
                self.client.accounts.withId("3520EE975815E478AFED5180CC32647934720EF5").transactions.list(params) { result in
                    switch (result) {
                    case .success(let transactionsList):
                        XCTAssertEqual(transactionsList.items.count, 1)
                        let accountTransaction = transactionsList.items [0]
                        
                        XCTAssertEqual(accountTransaction.transactionId, "201606200000371830001001")
                        
                        XCTAssertEqual(accountTransaction.accountParty?.accountNumber, "1157175073")
                        XCTAssertEqual(accountTransaction.accountParty?.bankCode, "0800")
                        
                        XCTAssertEqual(accountTransaction.amount?.value, 60000)
                        XCTAssertEqual(accountTransaction.amount?.precision, 2)
                        XCTAssertEqual(accountTransaction.amount?.currency.value, "CZK")
                        
                        XCTAssertEqual(accountTransaction.amountSender?.value, 60000)
                        XCTAssertEqual(accountTransaction.amountSender?.precision, 2)
                        XCTAssertEqual(accountTransaction.amountSender?.currency.value, "CZK")
                        
                        XCTAssertEqual(accountTransaction.bookingDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                        XCTAssertEqual(accountTransaction.constantSymbol, "308")
                        XCTAssertEqual(accountTransaction.description, "Úhrada")
                        XCTAssertEqual(accountTransaction.payeeNote, "Balcar David stravné ")
                        XCTAssertEqual(accountTransaction.transactionType, "80110")
                        XCTAssertEqual(accountTransaction.transactionTypeI18N, "Úhrada")
                        XCTAssertEqual(accountTransaction.valuationDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                        XCTAssertEqual(accountTransaction.variableSymbol, "2429")
                        
                        params = TransactionsParameters(pagination: Pagination(pageNumber:0, pageSize:1), dateStart: dateStart, dateEnd: dateEnd)
                        self.client.accounts.withId("3520EE975815E478AFED5180CC32647934720EF5").transactions.list(params) { result in
                            switch (result) {
                            case .success(let transactionsList):
                                XCTAssertEqual(transactionsList.items.count, 1)
                                let accountTransaction = transactionsList.items [0]
                                XCTAssertEqual(accountTransaction.transactionId, "201606200000795231001001")
                                
                                XCTAssertEqual(accountTransaction.accountParty?.accountNumber, "223149101")
                                XCTAssertEqual(accountTransaction.accountParty?.bankCode, "0100")
                                
                                XCTAssertEqual(accountTransaction.amount?.value, -153780)
                                XCTAssertEqual(accountTransaction.amount?.precision, 2)
                                XCTAssertEqual(accountTransaction.amount?.currency.value, "CZK")
                                
                                XCTAssertEqual(accountTransaction.amountSender?.value, -153780)
                                XCTAssertEqual(accountTransaction.amountSender?.precision, 2)
                                XCTAssertEqual(accountTransaction.amountSender?.currency.value, "CZK")
                                
                                XCTAssertEqual(accountTransaction.bookingDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                                XCTAssertEqual(accountTransaction.constantSymbol, "0008")
                                XCTAssertEqual(accountTransaction.description, "D.platba - S24/TB/GSM/B24")
                                XCTAssertEqual(accountTransaction.payerNote, "Vorlík zelenina - ovoce ")
                                XCTAssertEqual(accountTransaction.transactionType, "93504")
                                XCTAssertEqual(accountTransaction.transactionTypeI18N, "D.platba - S24/TB/GSM/B24")
                                XCTAssertEqual(accountTransaction.valuationDate, self.dateTimeFormatter.date(from: "2016-06-20T00:00:00+02:00" ))
                                XCTAssertEqual(accountTransaction.variableSymbol, "16273")
                                
                                expectation.fulfill()
                                
                            case .failure(let error):
                                XCTFail("Test failed with error: \(error.localizedDescription)")
                            }
                        }
                        
                    case .failure(let error):
                        XCTFail("Test failed with error: \(error.localizedDescription)")
                    }
                }
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 20.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesRelationshipManagersList()
    {
        self.judgeSession.setNextCase( "corporate.companies.relationshipmanagers.list", xcTestCase: self)
        
        let expectation      = self.expectation(description: "Response expectation")
        
        self.client.companies.withId("49624911").relationshipManagers.list(RelationshipManagersParameters(filter: .all)) { result in
            switch (result) {
            case .success(let relationshipManagersList):
                for index in 0..<relationshipManagersList.items.count {
                    let relationshipManager = relationshipManagersList.items [index]
                    switch index {
                    case 0:
                        XCTAssertEqual(relationshipManager.id, "1-NPJ")
                        XCTAssertEqual(relationshipManager.name, "Poradce MM 1")
                        XCTAssertTrue(relationshipManager.primaryFlag!)
                        
                        for employeeIndex in 0..<(relationshipManager.employees?.count)! {
                            guard let employee = relationshipManager.employees? [employeeIndex] else {
                                XCTFail("Missing employee!")
                                break
                            }
                            
                            switch employeeIndex {
                            case 0:
                                XCTAssertEqual(employee.empId, 583876)
                                XCTAssertEqual(employee.firstName, "Martina")
                                XCTAssertEqual(employee.lastName, "Bardonová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 1:
                                XCTAssertEqual(employee.empId, 578842)
                                XCTAssertEqual(employee.firstName, "Martina")
                                XCTAssertEqual(employee.lastName, "Boušová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 2:
                                XCTAssertEqual(employee.empId, 513843)
                                XCTAssertEqual(employee.firstName, "Dana")
                                XCTAssertEqual(employee.lastName, "Koutová")
                                XCTAssertTrue(employee.primaryFlag!)
                                
                            case 3:
                                XCTAssertEqual(employee.empId, 580342)
                                XCTAssertEqual(employee.firstName, "Jana")
                                XCTAssertEqual(employee.lastName, "Kovaříková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 4:
                                XCTAssertEqual(employee.empId, 583424)
                                XCTAssertEqual(employee.firstName, "Radka")
                                XCTAssertEqual(employee.lastName, "Pitrofová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 5:
                                XCTAssertEqual(employee.empId, 584262)
                                XCTAssertEqual(employee.firstName, "Lenka")
                                XCTAssertEqual(employee.lastName, "Šindelová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 6:
                                XCTAssertEqual(employee.empId, 587467)
                                XCTAssertEqual(employee.firstName, "Milada")
                                XCTAssertEqual(employee.lastName, "Strnadelová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 7:
                                XCTAssertEqual(employee.empId, 587129)
                                XCTAssertEqual(employee.firstName, "Michaela")
                                XCTAssertEqual(employee.lastName, "Talpová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 8:
                                XCTAssertEqual(employee.empId, 513832)
                                XCTAssertEqual(employee.firstName, "Jana")
                                XCTAssertEqual(employee.lastName, "Vilimovská")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            default:
                                XCTFail("Unexpected count of employees!")
                                
                            }
                        }
                        
                    case 1:
                        XCTAssertEqual(relationshipManager.id, "1-14L94-1003")
                        XCTAssertEqual(relationshipManager.name, "Poradce MM 3")
                        XCTAssertFalse(relationshipManager.primaryFlag!)
                        
                        for employeeIndex in 0..<(relationshipManager.employees?.count)! {
                            guard let employee = relationshipManager.employees? [employeeIndex] else {
                                XCTFail("Missing employee!")
                                break
                            }
                            
                            switch employeeIndex {
                            case 0:
                                XCTAssertEqual(employee.empId, 513789)
                                XCTAssertEqual(employee.firstName, "Šárka")
                                XCTAssertEqual(employee.lastName, "Cajthamlová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 1:
                                XCTAssertEqual(employee.empId, 586146)
                                XCTAssertEqual(employee.firstName, "Karel")
                                XCTAssertEqual(employee.lastName, "Děkan")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 2:
                                XCTAssertEqual(employee.empId, 577353)
                                XCTAssertEqual(employee.firstName, "Jana")
                                XCTAssertEqual(employee.lastName, "Dočekalová")
                                XCTAssertTrue(employee.primaryFlag!)
                                
                            case 3:
                                XCTAssertEqual(employee.empId, 535511)
                                XCTAssertEqual(employee.firstName, "Barbora")
                                XCTAssertEqual(employee.lastName, "Hrubá")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 4:
                                XCTAssertEqual(employee.empId, 533574)
                                XCTAssertEqual(employee.firstName, "Petra")
                                XCTAssertEqual(employee.lastName, "Jinšíková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 5:
                                XCTAssertEqual(employee.empId, 580223)
                                XCTAssertEqual(employee.firstName, "Michaela")
                                XCTAssertEqual(employee.lastName, "Karkošková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 6:
                                XCTAssertEqual(employee.empId, 579337)
                                XCTAssertEqual(employee.firstName, "Dita")
                                XCTAssertEqual(employee.lastName, "Kladívková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 7:
                                XCTAssertEqual(employee.empId, 513880)
                                XCTAssertEqual(employee.firstName, "Monika")
                                XCTAssertEqual(employee.lastName, "Maryšková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 8:
                                XCTAssertEqual(employee.empId, 579033)
                                XCTAssertEqual(employee.firstName, "Jana")
                                XCTAssertEqual(employee.lastName, "Mrláková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 9:
                                XCTAssertEqual(employee.empId, 585624)
                                XCTAssertEqual(employee.firstName, "Alexandra")
                                XCTAssertEqual(employee.lastName, "Petreková")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 10:
                                XCTAssertEqual(employee.empId, 513672)
                                XCTAssertEqual(employee.firstName, "Zuzana")
                                XCTAssertEqual(employee.lastName, "Šťastná")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 11:
                                XCTAssertEqual(employee.empId, 587030)
                                XCTAssertEqual(employee.firstName, "Jaroslav")
                                XCTAssertEqual(employee.lastName, "Stiel")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 12:
                                XCTAssertEqual(employee.empId, 580141)
                                XCTAssertEqual(employee.firstName, "Jana")
                                XCTAssertEqual(employee.lastName, "Vávrů")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 13:
                                XCTAssertEqual(employee.empId, 534549)
                                XCTAssertEqual(employee.firstName, "Magdaléna")
                                XCTAssertEqual(employee.lastName, "Vernerová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            case 14:
                                XCTAssertEqual(employee.empId, 581095)
                                XCTAssertEqual(employee.firstName, "Michaela")
                                XCTAssertEqual(employee.lastName, "Votrubová")
                                XCTAssertFalse(employee.primaryFlag!)
                                
                            default:
                                XCTFail("Unexpected count of employees!")
                                
                            }
                        }
                        
                    default:
                        XCTFail("Unexpected count of relationshipManagersList items!")
                    }
                }
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
            }
        }
        
        waitForExpectations(timeout: 10.0, handler:nil)
        
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesRelationshipmanagersSimple()
    {
        self.judgeSession.setNextCase( "corporate.companies.relationshipmanagers.simple", xcTestCase: self)
        
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.companies.withId("49624911").relationshipManagers.withId("583876").get { result in
            switch result {
            case .success(let employee):
                XCTAssertEqual(employee.personalNumber, "583876")
                XCTAssertEqual(employee.titleB, "Ing.")
                XCTAssertEqual(employee.name, "Martina")
                XCTAssertEqual(employee.surname, "Bardonová")
                XCTAssertEqual(employee.fullName, "Ing. Martina Bardonová")
                XCTAssertEqual(employee.gender?.value, "F")
                XCTAssertEqual(employee.employeeManagerId, 582107)
                XCTAssertEqual(employee.isManager, false)
                XCTAssertEqual(employee.isBlocked, false)
                XCTAssertEqual(employee.segment, "MAM")
                
                XCTAssertEqual(employee.contact?.loginName, "CEN83876")
                XCTAssertEqual(employee.contact?.costUnit, 40700162)
                
                XCTAssertEqual(employee.department?.id, 40000970)
                XCTAssertEqual(employee.department?.departmentCode, "UP_459")
                XCTAssertEqual(employee.department?.nameI18N, "Univerzální pob. Praha 2(Jugoslávská 19)")
                XCTAssertEqual(employee.department?.headId, 584607)
                XCTAssertEqual(employee.department?.parentId, 40004618)
                
                
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
                
            }
        }
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesRelationshipmanagersPhoto()
    {
        self.judgeSession.setNextCase( "corporate.companies.relationshipmanagers.photo", xcTestCase: self)
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.companies.withId("49624911").relationshipManagers.withId("583876").photo.download(RelationshipManagerPhotoParameters(type: .bw)) { result in
            switch result {
            case .success(let downloadedFilePath):
                XCTAssertEqual(URL(fileURLWithPath: downloadedFilePath).lastPathComponent, "photo.txt")
                expectation.fulfill()
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
                
            }
        }
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
    //--------------------------------------------------------------------------
    func testCorporateCompaniesRelationshipmanagersPhotoInfo()
    {
        self.judgeSession.setNextCase( "corporate.companies.relationshipmanagers.photo.info", xcTestCase: self)
        let expectation = self.expectation(description: "Response expectation")
        
        self.client.companies.withId("49624911").relationshipManagers.withId("583876").photo.info.get { result in
            switch result {
            case .success(let photoInfo):
                XCTAssertEqual(photoInfo.empId, 583876)
                XCTAssertEqual(photoInfo.agreementDate, self.dateFormatter.date(from: "2016-12-12" ))
                XCTAssertFalse(photoInfo.agreement!)
                XCTAssertEqual(photoInfo.mimeType, "image/jpeg")
                if let photoTypes = photoInfo.types, photoTypes.count == 1 {
                    XCTAssertEqual(photoTypes [0], "BW")
                    expectation.fulfill()
                }
                else {
                    XCTFail("Wrong photoInfo.types!")
                }
                
                
            case .failure(let error):
                XCTFail("Test failed with error: \(error.localizedDescription)")
                
            }
        }
        waitForExpectations(timeout: 10.0, handler:nil)
    }
    
}
