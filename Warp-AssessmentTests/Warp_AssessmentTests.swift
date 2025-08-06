//
//  Warp_AssessmentTests.swift
//  Warp-AssessmentTests
//
//  Created by Juliaan Evenwel on 2025/08/06.
//

import XCTest
@testable import Warp_Assessment

final class Warp_AssessmentTests: XCTestCase {

    func userNameExists() {
    
        /*
         this is just an example of what we could do with xctest. we have pretty strict guard statements in place on our viewmodel to catch errors but in a bigger project we would use xctest to ensure no invalid changes in code happened on the viewmodel
         */

        // Given (Arrange)
        let enteredUserName = "juliaan"
        //let fetch = UserViewModel()
        
        // When (Act)
        //let user = fetch.fetchUser(username: enteredUserName)
        
        // Then (Assert)
        XCTAssertNil(enteredUserName)
        
    }
    
}
