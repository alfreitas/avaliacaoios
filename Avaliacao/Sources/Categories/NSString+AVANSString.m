//
//  NSString+AVANSString.m
//  Avaliacao
//
//  Created by PiciOS2016 on 7/11/16.
//  Copyright © 2016 Cast Group. All rights reserved.
//

#import "NSString+AVANSString.h"

@implementation NSString (AVANSString)

//Remove os espaços e os caracteres \n do final da string
- (NSString *)trimAndNewLine{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
//Concatena as string
- (NSString *)concat:(NSString *)string{
    return [self stringByAppendingString:string];
}
//Subistitui as ocorrências de uma string por outra string
- (NSString*) substituir:(NSString *)string por:(NSString *)outraString{
    return [self stringByReplacingOccurrencesOfString:string withString:outraString];
}

@end
