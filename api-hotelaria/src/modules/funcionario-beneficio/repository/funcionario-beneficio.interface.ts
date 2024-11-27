import { Prisma } from '@prisma/client';

export interface FuncionarioBeneficioInterface {

  listarPorFuncionario(cpf: string);

  gravarMuitos(itens: Prisma.f_recebe_bUncheckedCreateInput[]);

  removerMuitos(idsBeneficios: number[]): Promise<void>;
}
