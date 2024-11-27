import { Prisma } from '@prisma/client';
import { PrismaService } from '../../prisma/prisma.service';
import { Injectable } from '@nestjs/common';
import { FuncionarioInterface } from './funcionario.interface';

@Injectable()
export class FuncionarioRepository implements FuncionarioInterface {
  constructor(private readonly prisma: PrismaService) {}

  async carregar(cpf: string) {
    return this.prisma.funcionario.findFirst({
      where: {
        cpf
      },
      include:{
        f_recebe_b: true
      }
    });
  }

  async listar(nome: string) {
    return this.prisma.funcionario.findMany({
      where: {
        OR: [
          {
            primeiro_nome: {
              contains: nome,
              mode: "insensitive"
            }
          },
          {
            sobrenome: {
              contains: nome,
              mode: "insensitive"
            }
          }
        ]
      },
      include:{
        f_recebe_b: true
      }
    });
  }

  async atualizar(
    data: Prisma.funcionarioUncheckedUpdateInput,
    cpf: string
  ) {
    await this.prisma.funcionario.update({
      data,
      where: {
        cpf,
      },
    });
  }

  async gravar(data: Prisma.funcionarioUncheckedCreateInput) {
    return this.prisma.funcionario.create({
      data,
    });
  }

  async remover(cpf: string): Promise<void> {
    await this.prisma.$transaction(async (pr) => {
      await pr.f_recebe_b.deleteMany({
        where: {
          cpf
        }
      });

      await pr.funcionario.delete({
        where: {
          cpf,
        },
      });
    });
  }
}
