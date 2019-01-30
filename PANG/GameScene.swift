//
//  GameScene.swift
//  PANG
//
//  Created by Daniel on 30/1/19.
//  Copyright © 2019 Placeholder Interactive. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var player = SKSpriteNode()
    var enemy = SKSpriteNode()
    
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func didMove(to view: SKView) {
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        player = self.childNode(withName: "player") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy: 20))
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame) // border around scene, making physics body programmatically
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // happens when finger put down
        for touch in touches {
            let location = touch.location(in: self) // gets location of finger inside of view
            player.run(SKAction.moveTo(x: location.x, duration: 0.2)) // follows finger
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // happens when finger dragged
        for touch in touches {
            let location = touch.location(in: self) // gets location of finger inside of view
            player.run(SKAction.moveTo(x: location.x, duration: 0.2)) // follows finger
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        enemy.run(.moveTo(x: ball.position.x, duration: 1)) // enemy follows ball
    }
}
