//
//  AVAProfileViewCell.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/11/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "AVAProfileViewCell.h"
#import "AVADownloadImageView.h"
#import "AVAProfile.h"
@interface AVAProfileViewCell()
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet AVADownloadImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblStatus;
@end

@implementation AVAProfileViewCell

- (void)setNome:(NSString *)nome{
    self.lblNome.text = nome;
}

- (void)setNickName:(NSString *)nickname{
   
}

- (void)setUrlAvatar:(NSString *)urlImage{
    
    [self.profileImageView setUrl:urlImage];
}
- (void)setStatus:(Status)status{
    NSString *dscStatus = @"Offline";
    switch(status) {
        case Online:
             dscStatus = @"Online";
            [self.lblStatus setTextColor:[UIColor greenColor]];
            break;
        case Busy:
            dscStatus = @"Ocupado";
            [self.lblStatus setTextColor:[UIColor redColor]];
            break;
        case Away:
            dscStatus = @"Ausente";
            [self.lblStatus setTextColor:[UIColor orangeColor]];
            break;
        case Snooze:
            dscStatus = @"Dormindo";
            [self.lblStatus setTextColor:[UIColor blackColor]];
            break;
        case LookingToTrade:
            dscStatus = @"Querendo Trocar";
            [self.lblStatus setTextColor:[UIColor blackColor]];
            break;
        case LookingToPlay:
            dscStatus = @"Querendo Jogar";
            [self.lblStatus setTextColor:[UIColor blackColor]];
            break;
        default:
            dscStatus = @"Offline";
            [self.lblStatus setTextColor:[UIColor blackColor]];
    }
    [self.lblStatus setText:dscStatus];
}




@end
