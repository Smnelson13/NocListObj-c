//
//  Agent.m
//  NocListObj-c
//
//  Created by Shane Nelson on 4/24/17.
//  Copyright © 2017 Shane Nelson. All rights reserved.
//

#import "Agent.h"

@implementation Agent

+ (Agent *)agentWithDictionary:(NSDictionary *)agentDict
{
  Agent *aAgent = nil;
  if (agentDict)
  {
    aAgent = [[Agent alloc] init];
    aAgent.realName = [agentDict objectForKey:@"realName"];
    aAgent.coverName = [agentDict objectForKey:@"coverName"];
  }
  
  return aAgent;
}



@end
