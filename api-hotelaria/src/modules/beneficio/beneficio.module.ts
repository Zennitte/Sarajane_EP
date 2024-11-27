import { Module } from '@nestjs/common';
import {  BeneficioService } from './beneficio.service';
import {  BeneficioController } from './beneficio.controller';
import { PrismaModule } from '../prisma/prisma.module';
import {  BeneficioRepository } from './repository/beneficio.repository';

@Module({
  imports: [PrismaModule],
  controllers: [ BeneficioController],
  providers: [ BeneficioService,  BeneficioRepository],
  exports: [ BeneficioService],
})
export class  BeneficioModule {}
