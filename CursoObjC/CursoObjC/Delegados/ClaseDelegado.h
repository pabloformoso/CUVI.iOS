//
//  ClaseDelegado.h
//  CursoObjC
//
//  Created by Pablo Formoso Estada on 04/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ClaseDelegado <NSObject>

- (NSString *)votoPorDelegado;

@optional

- (void)esteMetodoEsOpcional;

@end
