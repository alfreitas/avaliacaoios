//
//  AVAListarJogosRecentesViewController.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/13/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AVAProfile.h"

@interface AVAListarJogosViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, assign) AVAProfile  *profile;

@end
