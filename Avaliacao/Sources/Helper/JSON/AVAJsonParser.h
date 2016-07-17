//
//  PICJsonParser.h
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVAAmigo.h"
#import "AVAProfile.h"
#import "AVAGame.h"
@interface AVAJsonParser : NSObject
- (NSMutableArray<AVAAmigo>*)parseJson:(NSString*)caminhoArquivo;
- (NSMutableArray<AVAAmigo>*)parseJsonModel:(NSString*)caminhoArquivo;
- (NSMutableArray<AVAAmigo> *)parseJsonData:(NSData *)dataFile;
- (NSMutableArray<AVAProfile> *)parseJsonDataProfile:(NSData *)dataFile;
- (NSMutableArray<AVAGame> *)parseJsonDataGame:(NSData *)dataFile;
@end
