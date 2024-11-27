import { Module } from '@nestjs/common';
import { FuncionarioService } from './funcionario.service';
import { FuncionarioController } from './funcionario.controller';
import { PrismaModule } from '../prisma/prisma.module';
import { FuncionarioRepository } from './repository/funcionario.repository';
import { FuncionarioBeneficioModule } from '../funcionario-beneficio/funcionario-beneficio.module';

@Module({
  imports: [PrismaModule, FuncionarioBeneficioModule],
  controllers: [FuncionarioController],
  providers: [FuncionarioService, FuncionarioRepository],
  exports: [FuncionarioService],
})
export class FuncionarioModule {}