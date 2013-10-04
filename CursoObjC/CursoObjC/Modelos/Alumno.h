//
//  Alumno.h
//  CursoObjC
//
//  Created by Pablo Formoso Estada on 04/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "ClaseDelegado.h"
#import <Foundation/Foundation.h>

@interface Alumno : NSObject <ClaseDelegado>

- (id)initConNombre:(NSString *)unNombre
             yEmail:(NSString *)unEmail;

@property (nonatomic, strong) NSString *nombre;
@property (nonatomic, strong) NSString *email;


- (NSString *)imprimirAlumno;

- (void)contarUnaBatalla;

@end
