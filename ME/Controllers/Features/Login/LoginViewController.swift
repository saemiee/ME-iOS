//
//  LoginViewController.swift
//  ME
//
//  Created by 새미 on 3/10/24.
//

import UIKit
import AuthenticationServices

final class LoginViewController: BaseViewController {
    
    // MARK: - Properties
    private let meLogo = UIImageView().then {
        $0.image = UIImage(resource: .meLogo)
    }
    
    private let mainLabel = UILabel().then {
        $0.text = "나를 더 건강하게 만드는 ME"
        $0.setDynamicTextColor(darkModeColor: .white, lightModeColor: .black)
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "소비한 칼로리만큼의 포인트로\n상품을 교환해 보세요!"
        $0.numberOfLines = 2
        $0.setLineSpacing(spacing: 3)
        $0.font = .systemFont(ofSize: 16, weight: .regular)
        $0.textAlignment = .center
        $0.setDynamicTextColor(darkModeColor: .meLightGray, lightModeColor: .gray)
    }
    
    private let appleLoginButton = UIButton().then {
        $0.setImage(UIImage(resource: .appleLoginButton), for: .normal)
    }
    
    // MARK: - Life Cycel
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Add View
    override func addView() {
        [meLogo, mainLabel, descriptionLabel, appleLoginButton].forEach { view.addSubview($0) }
    }
    
    // MARK: - Layout
    override func setLayout() {
        meLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(280)
        }
        
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(meLogo.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainLabel.snp.bottom).offset(18)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(74)
        }
    }
    
    // MARK: - Selectors
    @objc func loginButtonTapped() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName]
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

extension LoginViewController: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
            if  let authorizationCode = appleIDCredential.authorizationCode,
                let identityToken = appleIDCredential.identityToken,
                let authCodeString = String(data: authorizationCode, encoding: .utf8),
                let identifyTokenString = String(data: identityToken, encoding: .utf8) {
                print("authorizationCode: \(authorizationCode)")
                print("identityToken: \(identityToken)")
                print("authCodeString: \(authCodeString)")
                print("identifyTokenString: \(identifyTokenString)")
            }
            
            print("useridentifier: \(userIdentifier)")
            print("fullName: \(String(describing: fullName))")
            print("email: \(String(describing: email))")
        
        case let passwordCredential as ASPasswordCredential:
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            print("username: \(username)")
            print("password: \(password)")
            
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("login failed - \(error.localizedDescription)")
    }
}
