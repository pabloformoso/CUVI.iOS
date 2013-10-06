//
//  main.m
//  CursoObjC
//
//  Created by Pablo Formoso Estada on 04/10/13.
//  Copyright (c) 2013 Pablo Formoso Estada. All rights reserved.
//
#import "Alumno.h"
#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
      Alumno *al = [[Alumno alloc] initConNombre:@"Pablo Formoso"
                                          yEmail:@"pablo@pabloformoso.com"];
      
      NSLog(@"%@", [al imprimirAlumno]);
      NSLog(@"%@", [[al nombre] cadidataParaBodaDelAlumno]);
      NSLog(@"Mi voto es para %@", [al votoPorDelegado]);
      
      if ([al respondsToSelector:@selector(esteMetodoEsOpcional)]) {
        [al performSelector:@selector(esteMetodoEsOpcional)];
      } else {
        NSLog(@"No entra en el if por que no está implementado.");
      }
      
      if ([al respondsToSelector:@selector(contarUnaBatalla)]) {
        [al performSelector:@selector(contarUnaBatalla)];
      } else {
        NSLog(@"No entra en el if por que no está implementado.");
      }
    }
  
    return 0;
}


