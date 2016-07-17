//
//  AVACoreDBData.h
//  Avaliacao
//
//  Created by PiciOS2016 on 7/16/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AVAUsuarioRegistrado.h"
@interface AVACoreDBData : NSObject

+ (AVAUsuarioRegistrado* _Nullable)novaInstancia;
- (void) save:(AVAUsuarioRegistrado* _Nullable)usuarioEntity;
- (AVAUsuarioRegistrado * _Nullable) getUsuarioRegistrado;
- (void) delete:(NSString* _Nullable)steamid;
@end
