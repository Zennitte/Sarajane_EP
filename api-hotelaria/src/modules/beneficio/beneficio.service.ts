import { BeneficioRepository } from './repository/beneficio.repository';
import { BadRequestException, Injectable } from '@nestjs/common';
import { BeneficioDTO } from './dto/beneficio.dto';
import { Prisma } from '@prisma/client';

@Injectable()
export class BeneficioService {
  constructor(
    private readonly beneficioRepository: BeneficioRepository,
  ) {}

  async listar(nome: string){
    nome = nome || '';
    return this.beneficioRepository.listar(nome);
  }

  async carregar(idamb: number): Promise<BeneficioDTO> {
    const beneficio: BeneficioDTO = await this.beneficioRepository.carregar(idamb);

    if (!beneficio) {
      throw new BadRequestException('Beneficio não encontrado');
    }

    return beneficio;
  }

  async gravar(beneficio: BeneficioDTO){
    if(!beneficio.idbenef){
      beneficio.idbenef = await this.beneficioRepository.buscarProximoId();
    }

    const dados: Prisma.beneficioUncheckedCreateInput = {
      tipo: beneficio.tipo,
      desconto: beneficio.desconto,
      valor: beneficio.valor,
      idbenef: beneficio.idbenef
    }

     return this.beneficioRepository.gravar(dados);
  }

  async atualizar(
    beneficio: BeneficioDTO,
    idbenef: number,
  ) {
    const dados_db = await this.beneficioRepository.carregar(idbenef);

    if(!dados_db){
      throw new BadRequestException("Beneficio não encontrado");
    }
  
    const dados: Prisma.beneficioUncheckedUpdateInput = {
     tipo: beneficio.tipo, 
     desconto: beneficio.desconto, 
     valor: beneficio.valor
    };
    
    return this.beneficioRepository.atualizar(dados, dados_db.idbenef);
  }


  async remover(idbenef: number) {
    const registro = await this.beneficioRepository.carregar(
      idbenef,
    );

    try {
      await this.beneficioRepository.remover(
        registro.idbenef,
      );
    } catch (error) {
      throw new BadRequestException(
        'Este registro não pode ser removido pois possui registros relacionados a ele',
      );
    }
  }
}
