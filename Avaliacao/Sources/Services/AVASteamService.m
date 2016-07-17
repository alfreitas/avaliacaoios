//
//  AVASteamService.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/10/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "AVASteamService.h"
#import "AVAAmigo.h"
#import "AVAProfile.h"
#import "AVAJsonParser.h"
#import "AVAGame.h"
#import "AVACoreDBData.h"

#define API_KEY @"E5FF691381469A0041A1F2AB85F74BD5"

@implementation AVASteamService

-(void) recuperaAmigosPorId:(NSString *)steamId callback:(void (^)(NSString *error, NSMutableArray<AVAAmigo> *arrayAmigos))callback{
    AVAJsonParser *jsonParser = [AVAJsonParser new];
    NSURLSession *session = [NSURLSession sharedSession];
    
     NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=%@&steamid=%@", API_KEY, steamId]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray<AVAAmigo>* arrayAmigos = [jsonParser parseJsonData:data];
            //arrayAmigos = [arrayAmigos subarrayWithRange:NSMakeRange(0, 80)];
            dispatch_async(dispatch_get_main_queue(), ^{
                // sleep(2.0);
                callback(error.description,arrayAmigos);
            });
        }else{
            callback(error.description,nil);
        }
    }];
    [task resume];
}


-(void) recuperaInformacaoSteamPorId:(NSString *)steamId callback:(void (^)(NSString *error, NSMutableArray<AVAProfile> *profiles))callback{
    AVAJsonParser *jsonParser = [AVAJsonParser new];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=%@&steamids=%@", API_KEY, steamId]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray<AVAProfile>* profiles = [jsonParser parseJsonDataProfile:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                // sleep(2.0);
                callback(error.description,profiles);
            });
        }else{
            callback(error.description,nil);
        }
    }];
    [task resume];
}

-(void) recuperaJogosRecentesSteamPorId:(NSString *)steamId callback:(void (^)(NSString *error, NSMutableArray<AVAGame> *profiles))callback{
    AVAJsonParser *jsonParser = [AVAJsonParser new];
    NSURLSession *session = [NSURLSession sharedSession];
    
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.steampowered.com/IPlayerService/GetRecentlyPlayedGames/v0001/?key=%@&steamid=%@&format=json", API_KEY, steamId]];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray<AVAGame>* games = [jsonParser parseJsonDataGame:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                // sleep(2.0);
                callback(error.description,games);
            });
        }else{
            callback(error.description,nil);
        }
    }];
    [task resume];
}

-(void) gravaUsuarioRegistrado:(NSString *)steamid{
    AVACoreDBData *db = [AVACoreDBData new];
    AVAUsuarioRegistrado *user = [db getUsuarioRegistrado];
    user.steamId = steamid;
    [db save:user];

}

-(NSString *) recuperaSteamIdUsuarioRegistrado{
    AVACoreDBData *db = [AVACoreDBData new];
     AVAUsuarioRegistrado *user = [db getUsuarioRegistrado];
    if(!user.steamId){
        return @"76561198145189797";
    }
    return user.steamId;
}

-(void) excluiUsuarioRegistrado:(NSString *)steamid{
    AVACoreDBData *db = [AVACoreDBData new];
    [db delete:steamid];

}


@end
