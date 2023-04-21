import Foundation
import UIKit

class AppCoordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
          let vc = MenuViewController()
            vc.coordinator = self
            navigationController.pushViewController(vc, animated: true)
    }
    
    func toAchivements() {
        let vc = AchivementsViewController()
          vc.coordinator = self
          navigationController.pushViewController(vc, animated: true)
    }

    func toLevel() {
        let vc = LevelViewController()
          vc.coordinator = self
          navigationController.pushViewController(vc, animated: true)
    }
    
    func toPlay() {
        let vc = PlayViewController()
          vc.coordinator = self
          navigationController.pushViewController(vc, animated: true)
    }
    
    func toSettings() {
        let vc = SettingsViewController()
          vc.coordinator = self
          navigationController.pushViewController(vc, animated: true)
    }
    

    func toBack() {
        
        self.navigationController.popViewController(animated: true)
    }
    
}
