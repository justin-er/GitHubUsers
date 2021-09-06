//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MockUserPresenter: UserPresenterInput {
    var delegate: UserPresenterDelegate?
       
    func getUser(username: String) {
        let userViewModel = UserViewModel(
            login: "nick57",
            avatarUrl: "",
            name: "Nick",
            location: "Tehran, Iran",
            bio: "I'm not great but good enough but very logn to show name and another long name to show and another agian and another to be very long",
            publicRepos: 23,
            publicGists: 13,
            htmlUrl: "www.amirrezaeghtedari.com",
            following: 89,
            followers: 340,
            createdAt: "Sep 2021"
        )

        self.delegate?.presenterDidGet(result: .success(userViewModel))
    }
    
    func getAvatar(user: UserViewModel) {
        // No need for now
    }
    
    func addUserToFavorites(user: UserViewModel) {
        // No need for now
    }
}

let userPresenter = MockUserPresenter()
let loadingViewProvider = LoadingViewProvider()
let alertViewProvider = AlertViewControllerProvider()

let sut = UserViewController(
    presenter: userPresenter,
    loadingViewProvider: loadingViewProvider,
    alertViewProvider: alertViewProvider)
                                                
userPresenter.delegate = sut
userPresenter.getUser(username: "")

sut.view.frame = CGRect(x: 0, y: 0, width: 350, height: 700)
PlaygroundPage.current.liveView = sut.view
