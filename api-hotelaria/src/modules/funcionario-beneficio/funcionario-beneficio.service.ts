import { FuncionarioBeneficioRepository } from './repository/funcionario-beneficio.repository';
import { BadRequestException, Injectable } from '@nestjs/common';
import { FuncionarioBeneficioDTO } from './dto/funcionario-beneficio.dto';
import { f_recebe_b, funcionario, Prisma } from '@prisma/client';

@Injectable()
export class FuncionarioBeneficioService {
  constructor(
    private readonly funcionarioRepository: FuncionarioBeneficioRepository,
  ) {}

  async movimentar(dados_gravar: FuncionarioBeneficioDTO[], dados_db: f_recebe_b[], cpf: string){
    const itens_excluir = new Array<number>();
    const itens_gravar = new Array<FuncionarioBeneficioDTO>();

    for(let item of dados_gravar){
      if(!dados_db.find(x => x.idbenef == item.idbenef)){
        itens_gravar.push({...item});
      }
    }

    for(let item of dados_db){
      if(!dados_gravar.find(x => x.idbenef == item.idbenef)){
        itens_excluir.push(item.idbenef);
      }
    }

    if(itens_excluir.length){
      await this.removerMuitos(itens_excluir);
    }

    if(itens_gravar.length){
      await this.gravarMuitos(itens_gravar, cpf);
    }
  }


  async gravarMuitos(itens: FuncionarioBeneficioDTO[], cpf: string){
    const itens_gravar = new Array<FuncionarioBeneficioDTO>();
    
    for(let item of itens){
      const dados: Prisma.f_recebe_bUncheckedCreateInput = {
        idbenef: +item.idbenef,
        cpf
      }

      itens_gravar.push(dados);
    }

    return this.funcionarioRepository.gravarMuitos(itens_gravar);
  }

  async removerMuitos(idsBeneficios: number[]) {
    try {
      await this.funcionarioRepository.removerMuitos(
        idsBeneficios
      );
    } catch (error) {
      throw new BadRequestException(
        'Este registro não pode ser removido pois possui registros relacionados a ele',
      );
    }
  }
}
