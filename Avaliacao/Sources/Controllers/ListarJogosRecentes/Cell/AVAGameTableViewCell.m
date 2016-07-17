//
//  AVAGameTableViewCell.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/14/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "AVAGameTableViewCell.h"
#import "AVADownloadImageView.h"
@interface AVAGameTableViewCell()
@property (weak, nonatomic) IBOutlet AVADownloadImageView *gameIcoImageView;
@property (weak, nonatomic) IBOutlet UILabel *lblNomeJogo;
@property (weak, nonatomic) IBOutlet UILabel *lblMinutosJogados;

@end

@implementation AVAGameTableViewCell

- (void)setNome:(NSString *)nome{
    self.lblNomeJogo.text = nome;
}

- (void)setMinutosJogados:(NSString *)minutosJogados{
    int hrs = [minutosJogados intValue] / 60;
    self.lblMinutosJogados.text =[NSString stringWithFormat:@"Horas jogadas %d", hrs];
}

- (void)setUrlJogo:(NSString *)urlImage{
    
    [self.gameIcoImageView setUrl:urlImage];
}



@end
