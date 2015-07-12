//
//  bluetoothHelper.h
//  iBrains
//
//  Created by Mark Griffith on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>



@interface bluetoothHelper : NSObject <GKSessionDelegate>

@property (nonatomic) int maxClients;
@property (nonatomic) NSArray *connectedClients;
@property (nonatomic) GKSession *session;

- (void)startAcceptingConnectionsForSessionID:(NSString *)sessionID;

@end
