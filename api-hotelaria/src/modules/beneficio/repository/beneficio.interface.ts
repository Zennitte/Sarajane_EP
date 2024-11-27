import { Prisma } from '@prisma/client';

export interface BeneficioInterface {

  carregar(idamb: number);

  atualizar(beneficio: Prisma.beneficioUncheckedUpdateInput, idamb: number): Promise<void>;

  gravar(beneficio: Prisma.beneficioUncheckedCreateInput);

  remover(idamb: number): Promise<void>;
}
