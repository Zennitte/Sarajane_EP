import { Module } from '@nestjs/common';
import { FuncionarioBeneficioService } from './funcionario-beneficio.service';
import { PrismaModule } from '../prisma/prisma.module';
import { FuncionarioBeneficioRepository } from './repository/funcionario-beneficio.repository';

@Module({
  imports: [PrismaModule],
  controllers: [],
  providers: [FuncionarioBeneficioService, FuncionarioBeneficioRepository],
  exports: [FuncionarioBeneficioService],
})
export class FuncionarioBeneficioModule {}
