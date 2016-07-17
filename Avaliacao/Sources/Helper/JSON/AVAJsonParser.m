//
//  PICJsonParser.m
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "AVAJsonParser.h"
#import "AVAAmigo.h"
#import "AVAProfile.h"
#import "AVAGame.h"


@implementation AVAJsonParser

- (NSMutableArray<AVAAmigo> *)parseJsonData:(NSData *)dataFile{
    
    NSMutableArray<AVAAmigo> *listaAmigos = [@[] mutableCopy];
    if (dataFile.length > 0) {
        NSError *error =nil;
        AVAAmigos *amigos = [[AVAAmigos alloc] initWithData:dataFile error:&error];
        listaAmigos = (NSMutableArray<AVAAmigo>*)[[amigos friendslist] friends];
        if (error) {
            NSLog(@"Erro ao fazer parser : %@", error.description);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    // [self parseData:listaAmigos data:dataFile];
    return listaAmigos;
}

- (NSMutableArray<AVAProfile> *)parseJsonDataProfile:(NSData *)dataFile{
    
    NSMutableArray<AVAProfile> *listaProfile = [@[] mutableCopy];
    if (dataFile.length > 0) {
        NSError *error =nil;
        AVAProfiles *x = [[AVAProfiles alloc] initWithData:dataFile error:&error];
        listaProfile = (NSMutableArray<AVAProfile>*)[[x response] players];
        if (error) {
            NSLog(@"Erro ao fazer parser : %@", error.description);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    // [self parseData:listaAmigos data:dataFile];
    return listaProfile;
}

- (NSMutableArray<AVAGame> *)parseJsonDataGame:(NSData *)dataFile{
    
    NSMutableArray<AVAGame> *listaGames = [@[] mutableCopy];
    if (dataFile.length > 0) {
        NSError *error =nil;
        AVAGames *x = [[AVAGames alloc] initWithData:dataFile error:&error];
        listaGames = (NSMutableArray<AVAGame>*)[[x response] games];
        if (error) {
            NSLog(@"Erro ao fazer parser : %@", error.description);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    // [self parseData:listaAmigos data:dataFile];
    return listaGames;
}

- (NSMutableArray<AVAAmigo> *)parseJson:(NSString *)caminhoArquivo{
    
    NSMutableArray<AVAAmigo> *listaAmigos = [@[] mutableCopy];
    NSData *data = [NSData dataWithContentsOfFile:caminhoArquivo];
    
    //[self parseData:listaAmigos data:data];
    
    return listaAmigos;
}

- (NSMutableArray<AVAAmigo> *)parseJsonModel:(NSString *)caminhoArquivo{
    
    NSMutableArray<AVAAmigo> *listaAmigos = nil;
    NSData *data = [NSData dataWithContentsOfFile:caminhoArquivo];
    
    if (data.length > 0) {
        NSError *error =nil;
        AVAAmigos *amigos = [[AVAAmigos alloc] initWithData:data error:&error];
        listaAmigos = (NSMutableArray<AVAAmigo>*)[[amigos friendslist] friends];
        if (error) {
            NSLog(@"Erro ao fazer parser : %@", error.description);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    
    return listaAmigos;
}



@end
