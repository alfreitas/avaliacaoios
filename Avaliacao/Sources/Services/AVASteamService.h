//
//  AVASteamService.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/10/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVAAmigo.h"
#import "AVAProfile.h"
#import "AVAGame.h"
@interface AVASteamService : NSObject

- (void) recuperaInformacaoSteamPorId:(NSString*)steamId  callback:(void (^) (NSString * error, NSMutableArray<AVAProfile> *profiles))callback;

- (void) recuperaAmigosPorId:(NSString*)steamId callback:(void (^) (NSString * error, NSMutableArray<AVAAmigo> *arrayAmigos))callback;
- (void) recuperaJogosRecentesSteamPorId:(NSString*)steamId callback:(void (^) (NSString * error, NSMutableArray<AVAGame> *arrayGames))callback;
-(void) gravaUsuarioRegistrado:(NSString *)steamid;
-(NSString *) recuperaSteamIdUsuarioRegistrado;
-(void) excluiUsuarioRegistrado:(NSString *)steamid;
@end
