//
//  MenuViewController.swift
//  ForestPuzzle
//
//  Created by foxtree on 21.04.23.
//

import Foundation
import UIKit
import AVFoundation


class MenuViewController: UIViewController {
    
    weak var coordinator: AppCoordinator?
    var backgroundMusicPlayer: AVAudioPlayer?
    let buttonTitles = ["Achivements", "Level", "Play"]
    let normalBackgroundImage = "menuButton"
    let selectedBackgroundImage = "selectedMenuButton"
    let customFontName = "MeriendaOne-Regular"
    let customFontSize: CGFloat = 40
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    override func viewDidLoad () {
        super.viewDidLoad()
        playMusic()
        setViews()
    }
    
    private func setViews() {
        setBackground()
        
        for i in 0..<buttonTitles.count {
            let button = UIButton()
            button.tag = i
            button.setTitle(buttonTitles[i], for: .normal)
            
            button.titleLabel?.font = UIFont(name: customFontName, size: customFontSize)
            button.setBackgroundImage(UIImage(named: normalBackgroundImage), for: .normal)
            button.setTitleColor(.white , for: .highlighted)
            button.setTitleColor(UIColor(red: 0.388, green: 0.196, blue: 0.102, alpha: 1), for: .normal)
            button.setBackgroundImage(UIImage(named: selectedBackgroundImage), for: .highlighted)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(button)
        }
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func playMusic() {
        // backgroundMusicPlayer?.stop()
        let path = Bundle.main.path(forResource: "backMusic", ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            backgroundMusicPlayer = try AVAudioPlayer(contentsOf: url)
            backgroundMusicPlayer?.numberOfLoops = -1 // infinite loop
            backgroundMusicPlayer?.play()
        } catch {
            // handle error
        }
    }
    
    //MARK: - Actions
    
    @objc func buttonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            coordinator?.toAchivements()
        case 1:
            coordinator?.toLevel()
        default:
            coordinator?.toPlay()
        }
        
    }
}

extension UIViewController {
    
    func setBackground() {
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill // or .scaleAspectFit
        view.insertSubview(backgroundImageView, at: 0)
        backgroundImageView.frame = view.frame
    }
}
