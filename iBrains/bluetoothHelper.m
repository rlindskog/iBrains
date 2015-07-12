//
//  bluetoothHelper.m
//  iBrains
//
//  Created by Mark Griffith on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

#import "bluetoothHelper.h"

@implementation bluetoothHelper


- (void)startAcceptingConnectionsForSessionID:(NSString *)sessionID
{
	self.connectedClients = [NSMutableArray arrayWithCapacity:self.maxClients];
 
	self.session = [[GKSession alloc] initWithSessionID:sessionID displayName:nil sessionMode:GKSessionModeServer];
	self.session.delegate = self;
	self.session.available = YES;
}

- (NSArray *)connectedClients
{
	return self.connectedClients;
}

#pragma mark - GKSessionDelegate

- (void)session:(GKSession *)session peer:(NSString *)peerID didChangeState:(GKPeerConnectionState)state
{
#ifdef DEBUG
	NSLog(@"MatchmakingServer: peer %@ changed state %d", peerID, state);
#endif
}

- (void)session:(GKSession *)session didReceiveConnectionRequestFromPeer:(NSString *)peerID
{
#ifdef DEBUG
	NSLog(@"MatchmakingServer: connection request from peer %@", peerID);
#endif
}

- (void)session:(GKSession *)session connectionWithPeerFailed:(NSString *)peerID withError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"MatchmakingServer: connection with peer %@ failed %@", peerID, error);
#endif
}

- (void)session:(GKSession *)session didFailWithError:(NSError *)error
{
#ifdef DEBUG
	NSLog(@"MatchmakingServer: session failed %@", error);
#endif
}

@end
