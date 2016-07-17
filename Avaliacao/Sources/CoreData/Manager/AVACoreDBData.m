//
//  AVACoreDBData.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/16/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//
#import "AppDelegate.h"
#import "AVACoreDBData.h"
#import "AVAUsuarioRegistrado.h"
@implementation AVACoreDBData

+ (AVAUsuarioRegistrado*) novaInstancia{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    AVAUsuarioRegistrado *c = [NSEntityDescription insertNewObjectForEntityForName:@"AVAUsuarioRegistrado" inManagedObjectContext:context];
    
    return c;
}


- (void) save:(AVAUsuarioRegistrado*)usuarioEntity{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    if (!usuarioEntity.ultimaAtualizacao) {
        [usuarioEntity setUltimaAtualizacao:[NSDate date]];
    }
    
    //[context insertObject:carroEntity];
    
    NSError *error = nil;
    
    [context save:&error];
    if (error) {
        NSLog(@"Erro ao salvar contexto %@", error.description);
    }
    
}


- (AVAUsuarioRegistrado * _Nullable) getUsuarioRegistrado{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AVAUsuarioRegistrado" inManagedObjectContext:context];
    
    NSFetchRequest *request = [NSFetchRequest new];
    request.entity = entity;
    
    NSSortDescriptor *sortedDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"ultimaAtualizacao" ascending:YES];
    
    id sortDescriptors = @[sortedDescriptor];
    request.sortDescriptors = sortDescriptors;
    
    NSError *error = nil;
    NSArray<AVAUsuarioRegistrado*> *array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Erro na consulta %@", error.description);
    }
    
    return array.firstObject;
}

- (void) delete:(NSString*)steamid{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    AVAUsuarioRegistrado *user = self.getUsuarioRegistrado;
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error = nil;
    if(user.steamId==steamid){
    [context deleteObject:user];
    }
    
    [context save:&error];
    if (error) {
        NSLog(@"Erro na consulta %@", error.description);
    }
    
}
@end
