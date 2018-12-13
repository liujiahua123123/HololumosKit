//
//  GameViewController.swift
//  SceneKitTest
//
//12/2/18.
//
//

import SceneKit
import QuartzCore

class GameViewController: NSViewController {
    
    lazy var sceneView = {return FourPictureView(frame: self.view.bounds, filePath: "model.scnassets/obj.dae")}() // initiation of the view, path is required in order to find the model
    let backgroundView = NSView.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        //create the background color (black)
        backgroundView.frame = self.view.bounds
        backgroundView.wantsLayer = true
        backgroundView.layer?.backgroundColor = NSColor.black.cgColor
        //adding views
        self.view.addSubview(backgroundView)
        self.view.addSubview(sceneView)
    }
    //layout views when strectch the window
    override func viewDidLayout() {
        super.viewDidLayout()
        self.sceneView.frame = self.view.bounds
        self.backgroundView.frame = self.view.bounds
        let length = self.view.bounds.height < self.view.bounds.width ? self.view.bounds.height : self.view.bounds.width
        self.sceneView.frame.size = CGSize.init(length: length)
        self.sceneView.center = self.view.boundCenter
    }
}
