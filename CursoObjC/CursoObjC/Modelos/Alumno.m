//
//  Alumno.m
//  CursoObjC
//
//  Created by Pablo Formoso Estada on 04/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//

#import "Alumno.h"

@implementation Alumno

- (id)initConNombre:(NSString *)unNombre
             yEmail:(NSString *)unEmail {
  
  self = [super init];
  
  if (self) {
    _nombre = unNombre;
    _email = unEmail;
  }
  
  return self;
}

- (NSString *)imprimirAlumno {
    return [NSString stringWithFormat:@"%@ - %@", _nombre, _email];
}

- (NSString *)votoPorDelegado {
    return @"Luis";
}


- (void)contarUnaBatalla {
    NSLog(@"Un batalla de estas que vamos!!");
}








@end
