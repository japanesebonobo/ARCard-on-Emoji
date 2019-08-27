import UIKit
import SpriteKit
import ARKit

class GameViewController: UIViewController,  ARSCNViewDelegate, ARSKViewDelegate {
    
   
    
    @IBOutlet var sceneView: ARSCNView!
    let defaultConfiguration: ARWorldTrackingConfiguration = {
        let configuration = ARWorldTrackingConfiguration()
        
        let images = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil)
        
        configuration.detectionImages = images
        configuration.planeDetection = .horizontal
        configuration.environmentTexturing = .automatic
        return configuration
    }()
    
    private var spriteNode: SKNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sceneView.delegate = self
        sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        sceneView.session.run(defaultConfiguration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {}
    func sessionWasInterrupted(_ session: ARSession) {}
    func sessionInterruptionEnded(_ session: ARSession) {}
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SKSpriteNode, for anchor: ARAnchor) {
        guard let imageAnchor = anchor as? ARImageAnchor else {
            return
        }
        
        let spriteNode = SKSpriteNode(imageNamed: "art.scnassets/sword.png")
        spriteNode.position = CGPoint(x: 150, y: 150)
        spriteNode.addChild(spriteNode)
    }
}
