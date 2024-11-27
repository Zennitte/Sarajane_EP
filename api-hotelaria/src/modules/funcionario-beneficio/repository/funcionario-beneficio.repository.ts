import { Prisma } from '@prisma/client';
import { PrismaService } from '../../prisma/prisma.service';
import { Injectable } from '@nestjs/common';
import { FuncionarioBeneficioInterface } from './funcionario-beneficio.interface';

@Injectable()
export class FuncionarioBeneficioRepository implements FuncionarioBeneficioInterface {
  constructor(private readonly prisma: PrismaService) {}

  async listarPorFuncionario(cpf: string) {
    return this.prisma.f_recebe_b.findMany({
      where: {
        cpf
      }
    });
  }

  async gravarMuitos(data: Prisma.f_recebe_bUncheckedCreateInput[]) {
    return this.prisma.f_recebe_b.createMany({
      data,
    });
  }

  async removerMuitos(idsBeneficios: number[]): Promise<void> {
    await this.prisma.f_recebe_b.deleteMany({
      where: {
        idbenef: {
          in: idsBeneficios
        }
      },
    });

    return;
  }
}
