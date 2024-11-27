import { Prisma } from '@prisma/client';

export interface FuncionarioInterface {

  carregar(cpf: string);

  atualizar(funcionario: Prisma.funcionarioUncheckedUpdateInput, cpf: string): Promise<void>;

  gravar(funcionario: Prisma.funcionarioUncheckedCreateInput);

  remover(cpf: string): Promise<void>;
}
