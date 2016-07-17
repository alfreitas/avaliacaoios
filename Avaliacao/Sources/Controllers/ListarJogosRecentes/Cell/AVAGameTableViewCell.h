//
//  AVAGameTableViewCell.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/14/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AVAGameTableViewCell : UITableViewCell
- (void) setNome:(NSString*)nome;
- (void) setMinutosJogados:(NSString*)minutosJogados;
- (void) setUrlJogo:(NSString*)urlImage;
@end
