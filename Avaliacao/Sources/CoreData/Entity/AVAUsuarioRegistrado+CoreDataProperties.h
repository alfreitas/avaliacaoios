//
//  AVAUsuarioRegistrado+CoreDataProperties.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/16/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "AVAUsuarioRegistrado.h"

NS_ASSUME_NONNULL_BEGIN

@interface AVAUsuarioRegistrado (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *steamId;
@property (nullable, nonatomic, retain) NSDate *ultimaAtualizacao;

@end

NS_ASSUME_NONNULL_END
