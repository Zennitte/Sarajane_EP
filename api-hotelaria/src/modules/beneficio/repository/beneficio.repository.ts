import { Prisma } from '@prisma/client';
import { PrismaService } from '../../prisma/prisma.service';
import { Injectable } from '@nestjs/common';
import { BeneficioInterface } from './beneficio.interface';

@Injectable()
export class BeneficioRepository implements BeneficioInterface {
  constructor(private readonly prisma: PrismaService) {}

  async carregar(idbenef: number) {
    return this.prisma.beneficio.findFirst({
      where: {
        idbenef
      }
    });
  }

  async listar(nome: string) {
    return this.prisma.beneficio.findMany({
      where: {
        tipo: {
          contains: nome,
          mode: "insensitive"
        }
      }
    });
  }

  async buscarProximoId(){
    const beneficio = await this.prisma.beneficio.findFirst({
      orderBy:{
        idbenef: 'desc'
      }
    });


    return beneficio ? beneficio.idbenef + 1 : 1;
  }

  async atualizar(
    data: Prisma.beneficioUncheckedUpdateInput,
    idbenef: number
  ) {
    await this.prisma.beneficio.update({
      data,
      where: {
        idbenef,
      },
    });
  }

  async gravar(data: Prisma.beneficioUncheckedCreateInput) {
    return this.prisma.beneficio.create({
      data,
    });
  }

  async remover(idbenef: number): Promise<void> {
    await this.prisma.beneficio.delete({
      where: {
        idbenef,
      },
    });

    return;
  }
}
