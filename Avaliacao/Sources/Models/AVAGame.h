//
//  AVAGame.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/13/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface AVAGame : JSONModel
@property (nonatomic, strong) NSString *appid;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *playtime_2weeks;
@property (nonatomic, strong) NSString *playtime_forever;
@property (nonatomic, strong) NSString *img_icon_url;
@property (nonatomic, strong) NSString *img_logo_url;

@end

@protocol AVAGame
@end

@interface AVAGameList : JSONModel

@property (nonatomic, strong) NSMutableArray<AVAGame> *games;

@end

@interface AVAGames : JSONModel

@property (nonatomic, strong) AVAGameList *response;
@end

