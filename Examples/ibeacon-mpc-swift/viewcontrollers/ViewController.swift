//
//  ViewController.swift
//  viewcontrollers
//
//  Created by Matthew Schmulen on 9/28/14.
//  Copyright (c) 2014 Matthew Schmulen. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController ,MCBrowserViewControllerDelegate , MCSessionDelegate {
    
    let serviceType = "LCOC-Chat"
    
    var browser : MCBrowserViewController!
    var assistant : MCAdvertiserAssistant!
    var session : MCSession!
    var peerID: MCPeerID!
    
    @IBOutlet var chatView: UITextView!
    @IBOutlet var messageField: UITextField!
    
    @IBAction func sendChat(sender: UIButton) {
        // Bundle up the text in the message field, and send it off to all
        // connected peers
        
        let msg = self.messageField.text.dataUsingEncoding(NSUTF8StringEncoding,
            allowLossyConversion: false)
        
        var error : NSError?
        
        self.session.sendData( msg, toPeers: self.session.connectedPeers, withMode: MCSessionSendDataMode.Unreliable, error:&error)
        
        if error != nil {
            print("Error sending data: \(error?.localizedDescription)")
        }
        
        self.updateChat(self.messageField.text, fromPeer: self.peerID)
        
        self.messageField.text = ""
        
    }
    
    @IBAction func showBrowser(sender: UIButton) {
        // Show the browser view controller
        self.presentViewController(self.browser, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MPC
        self.peerID = MCPeerID(displayName: UIDevice.currentDevice().name)
        self.session = MCSession(peer: peerID)
        self.session.delegate = self
        
        // create the browser viewcontroller with a unique service name
        self.browser = MCBrowserViewController(serviceType:serviceType,
            session:self.session)
        
        // MAS TODO
        self.browser.delegate = self;
        
        self.assistant = MCAdvertiserAssistant(serviceType:serviceType,
            discoveryInfo:nil, session:self.session)
        
        // tell the assistant to start advertising our fabulous chat
        self.assistant.start()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - MCBrowswerViewControllerDelegate
    /*
    optional func browserViewController( browserViewController: MCBrowserViewController!,
    shouldPresentNearbyPeer peerID: MCPeerID!,
    withDiscoveryInfo info: [NSObject : AnyObject]!) -> Bool
    {
        //println("Did go into the delegate")
        // [self.browserVC dismissViewControllerAnimated:YES completion:nil];
        return true
    }
    */
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController!)
    {
        println("Did go into the delegate")
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func browserViewControllerWasCancelled( browserViewController: MCBrowserViewController!)  {
        // Called when the browser view controller is cancelled
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func updateChat(text : String, fromPeer peerID: MCPeerID) {
        // Appends some text to the chat view
        
        // If this peer ID is the local device's peer ID, then show the name
        // as "Me"
        var name : String
        
        switch peerID {
        case self.peerID:
            name = "Me"
        default:
            name = peerID.displayName
        }
        
        // Add the name to the message and display it
        let message = "\(name): \(text)\n"
        self.chatView.text = self.chatView.text + message
        
    }
    
    func session(session: MCSession!, didReceiveData data: NSData!,
        fromPeer peerID: MCPeerID!)  {
            // Called when a peer sends an NSData to us
            println( "peer sent Data")
            
            // This needs to run on the main queue
            dispatch_async(dispatch_get_main_queue()) {
                
                var msg = NSString(data: data, encoding: NSUTF8StringEncoding)
                
                self.updateChat(msg, fromPeer: peerID)
            }
    }
    
    // The following methods do nothing, but the MCSessionDelegate protocol
    // requires that we implement them.
    func session(session: MCSession!,
        didStartReceivingResourceWithName resourceName: String!,
        fromPeer peerID: MCPeerID!, withProgress progress: NSProgress!)  {
            
            // Called when a peer starts sending a file to us
            println("didStartReceivingResourceWithName ")
    }
    
    func session(session: MCSession!,
        didFinishReceivingResourceWithName resourceName: String!,
        fromPeer peerID: MCPeerID!,
        atURL localURL: NSURL!, withError error: NSError!)  {
            // Called when a file has finished transferring from another peer
            println("didFinishReceivingResourceWithName ")
    }
    
    func session(session: MCSession!, didReceiveStream stream: NSInputStream!,
        withName streamName: String!, fromPeer peerID: MCPeerID!)  {
            // Called when a peer establishes a stream with us
            println("didReceiveStream ")
    }
    
    func session(session: MCSession!, peer peerID: MCPeerID!,
        didChangeState state: MCSessionState)  {
            // Called when a connected peer changes state (for example, goes offline)
            println("session change state ")
    }



}

