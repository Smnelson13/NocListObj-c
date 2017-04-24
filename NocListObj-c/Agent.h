//
//  Agent.h
//  NocListObj-c
//
//  Created by Shane Nelson on 4/24/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Agent : NSObject

@property (nonatomic) NSString *realName;
@property (nonatomic) NSString *coverName;

+ (Agent *)agentWithDictionary:(NSDictionary *)AgentDict;

@end
