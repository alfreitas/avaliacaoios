//
//  AVAProfileViewCell.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/11/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVAProfile.h"
@interface AVAProfileViewCell : UITableViewCell
- (void) setNome:(NSString*)nome;
- (void) setNickName:(NSString*)nickname;
- (void) setUrlAvatar:(NSString*)urlImage;
- (void)setStatus:(Status)status;
@end
