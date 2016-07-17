//
//  AVAAmigo.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/10/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
@interface AVAAmigo : JSONModel
@property (nonatomic, strong) NSString *steamid;
@property (nonatomic, strong) NSString *relationship;
@property (nonatomic, strong) NSString *friend_since;
@end

@protocol AVAAmigo
@end

@interface AVAAmigoList : JSONModel

@property (nonatomic, strong) NSMutableArray<AVAAmigo> *friends;

@end

@interface AVAAmigos : JSONModel

@property (nonatomic, strong) AVAAmigoList *friendslist;

@end
