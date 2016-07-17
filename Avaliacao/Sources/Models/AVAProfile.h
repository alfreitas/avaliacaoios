//
//  AVAProfile.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/10/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

typedef NS_ENUM(NSInteger, Status)
{
    Offline = 0,
    Online = 1,
    Busy = 2,
    Away = 3,
    Snooze = 4,
    LookingToTrade = 5,
    LookingToPlay = 6
} ;

@interface AVAProfile : JSONModel
@property (nonatomic, strong) NSString *steamid;
@property (nonatomic, strong) NSString *communityvisibilitystate;
@property (nonatomic, strong) NSString *personaname;
@property (nonatomic, strong) NSString *realname;
@property (nonatomic, strong) NSString *lastlogoff;
@property (nonatomic, strong) NSString *profileurl;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *avatarmedium;
@property (nonatomic, strong) NSString *avatarfull;
@property (nonatomic, strong) NSString *personastate;
@end

@protocol AVAProfile
@end

@interface AVAProfileList : JSONModel

@property (nonatomic, strong) NSMutableArray<AVAProfile> *players;

@end

@interface AVAProfiles : JSONModel

@property (nonatomic, strong) AVAProfileList *response;

@end

