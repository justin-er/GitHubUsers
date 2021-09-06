//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MockUserInteractor: UserInteractorInput {
    
    let user = User(
        login: "nick57",
        avatarUrl: "",
        name: "Nick",
        location: "Tehran, Iran",
        bio: "I'm not great but good enough",
        publicRepos: 23,
        publicGists: 13,
        htmlUrl: "www.amirrezaeghtedari.com",
        following: 89,
        followers: 340,
        createdAt: Date()
    )

    var delegate: UserInteractorDelegate?
    
    func getUser(username: String) {
        self.delegate?.interactorDidGet(result: Result.success(user))
    }
    
    func getAvatar(user: User) {
        // No need for now
    }
    
    func addUserToFavorites(user: User) {
        // No need for now
    }
}

class MockLoadingViewProvider: LoadingViewProviderInput {
    func showLoading(on view: UIView) {
        // No need for now
    }
    
    func dismissLoading() {
        // No need for now
    }
}

class MockUserPresenter: UserPresenterInput {
    
    var delegate: UserPresenterDelegate?
   
    func presenterDidGet(result: Result<UserViewModel, UserNetworkError>) {
        
        let userViewModel = UserViewModel(
            login: "nick57",
            avatarUrl: "",
            name: "Nick",
            location: "Tehran, Iran",
            bio: "I'm not great but good enough",
            publicRepos: 23,
            publicGists: 13,
            htmlUrl: "www.amirrezaeghtedari.com",
            following: 89,
            followers: 340,
            createdAt: "Sep 2021 Sep 2021 Sep 2021 Sep 2021 Sep 2021"
        )
        
        func loadMockData() {
            self.delegate?.presenterDidGet(result: .success(userViewModel))
        }
    }
    
    func presenterDidGetAvatar(result: Result<UserViewModel, AvatarNetworkError>) {
        // No need for now
    }
    
    func presenterDidAddUserToFavories(_: UserPresenterInput, user: UserViewModel, error: Error?) {
        // No need for now
    }
}

let userInteractor = MockUserInteractor()
let userPresenter = UserPresenter()
userInteractor.delegate = userPresenter
let loadingViewProvider = LoadingViewProvider()
let alertViewProvider = AlertViewControllerProvider()

let sut = UserViewController(
    interactor: userInteractor,
    loadingViewProvider: loadingViewProvider,
    alertViewProvider: alertViewProvider)
                                                
userPresenter.delegate = sut
sut.representUser(username: "Nick", avatar: nil)

sut.view.frame = CGRect(x: 0, y: 0, width: 350, height: 700)
PlaygroundPage.current.liveView = sut.view
