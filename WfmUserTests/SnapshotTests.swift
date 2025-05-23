//
//  SnapshotTests.swift
//  WfmUserTests
//
//  Created by Mustafa Alper Aydin on 14.05.2025.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import WfmUser
final class SnapshotTests: XCTestCase {
    
    private let mainPageVM = MainPageViewModel()
    private let homePageVM = HomePageViewModel()
    private let appState = AppState()
    
    override func setUp() {
        super.setUp()
        isRecording = true
    }

    func testHeaderBarView() {
        /*withSnapshotTesting(diffTool: .ksdiff) {
            let view = HeaderBarView(showMenu: .constant(false))
                .environmentObject(mainPageVM)
            
            assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
        } */
        let view = HeaderBarView(showMenu: .constant(false))
            .environmentObject(mainPageVM)
        
        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }

    func testHomePageView() {
        let homePageVM = HomePageViewModel()
        waitForAsyncLoad()

        let view = HomePageView()
            .environmentObject(homePageVM)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }

    func testHomePageListWeeklyPageView() {
        let viewModel = HomePageViewModel()
        waitForAsyncLoad()

        let view = HomePageListWeeklyPageView()
            .environmentObject(homePageVM)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }

    func testHomePageDashboard() {
        let viewModel = HomePageViewModel()
        waitForAsyncLoad()

        let view = HomePageDashboard()
            .environmentObject(homePageVM)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }

    func testMonthlyPageView() {
        let viewModel = HomePageViewModel()
        waitForAsyncLoad()

        let view = MonthlyPageView(currentMonth: Date())
            .environmentObject(viewModel)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }

    func testLeftListMenuView() {
        let view = LeftListMenuView(showMenu: .constant(true), pageType: .constant(0))
            .environmentObject(mainPageVM)
            .environmentObject(appState)
            .environmentObject(homePageVM)
        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func testLogoutDialogView() {
        let view = LogoutDialogView(useFullScreenWrapper: false)
            .environmentObject(appState)
            .environmentObject(mainPageVM)
        
        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func testErrorDialogView() {
        let view = ZStack {
            ErrorDialogView(
                isErrorDialog: .constant(true),
                isAnimate: .constant(false),
                type: ErrorTypes.WARNING,
                text: "Snapshot test hatası",
                errorCode: LecyStatus.gidiyorum,
                useFullScreenWrapper: false
            )
            .environmentObject(AppState())
            .environmentObject(HomePageViewModel())
        }
        .frame(width: 390, height: 844) // Ekran boyutunu sabitle

        let exp = expectation(description: "Bekleme")
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            exp.fulfill()
        }
        wait(for: [exp], timeout: 1)

        assertSnapshot(matching: view.asVC(), as: .image(size: CGSize(width: 390, height: 844)))
    }
    
    func testToastView() {
        homePageVM.isToastMessage = true
        homePageVM.isToastMessageText = "İşlem başarılı"
        homePageVM.isToastMessageBgColor = .green

        let view = ToastView(
            isPresented: .constant(true),
            toastMessage: homePageVM.isToastMessageText,
            color: homePageVM.isToastMessageBgColor
        )

        waitForAsyncLoad()

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func testChangeLanguageInfoDialog() {
        mainPageVM.isChangeLanguageInfoDialog = true

        let view = ChangeLanguageInfoDialog(
            isChangeLanguageInfoDialog: .constant(false)
        )

        waitForAsyncLoad()

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func testHomePageRoutePageView() {
        let view = HomePageRoutePageView()
            .environmentObject(homePageVM)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func testNavigatePageView_withSelectedPoint() {
        // Öncelikle homePageVM.selectedPoint'e bir point atıyoruz
        homePageVM.selectedPoint = homePageVM.personelDayRoutePointArray.first // ya da uygun bir örnek
            
        let view = NavigatePageView(selectedPoint: homePageVM.selectedPoint)
            .environmentObject(homePageVM)
        
        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func testAddNewAddressDialogView() {
        let view = AddNewAddressDialogView()
            .environmentObject(homePageVM)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }

    func testRerouteDialogView() {
        let view = RerouteDialogView()
            .environmentObject(homePageVM)

        assertSnapshot(matching: view.asVC(), as: .image(on: .iPhone13))
    }
    
    func waitForAsyncLoad(delay: TimeInterval = 0.3) {
        let exp = XCTestExpectation(description: "ViewModel async yüklemeyi tamamlasın")
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            exp.fulfill()
        }
        wait(for: [exp], timeout: delay + 1.0)
    }
}


//commit test

@testable import WfmUser
final class WfmUserTestsDeneme: XCTestCase {
    
    func testExampleSuccess() {
        // test
        let sum = 2 + 2
        XCTAssertEqual(sum, 4, "Toplama işlemi beklenen sonucu döndürmedi.")
    }
}

extension View {
    func asVC() -> UIViewController {
        UIHostingController(rootView: self)
    }
}

