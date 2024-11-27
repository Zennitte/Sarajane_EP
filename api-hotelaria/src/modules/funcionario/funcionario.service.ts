import { FuncionarioRepository } from './repository/funcionario.repository';
import { BadRequestException, Injectable } from '@nestjs/common';
import { FuncionarioDTO } from './dto/funcionario.dto';
import { funcionario, Prisma } from '@prisma/client';
import { FuncionarioBeneficioService } from '../funcionario-beneficio/funcionario-beneficio.service';

@Injectable()
export class FuncionarioService {
  constructor(
    private readonly funcionarioRepository: FuncionarioRepository,
    private readonly funcionarioBeneficioService: FuncionarioBeneficioService,
  ) {}


  async listar(nome: string){
    nome = nome || '';
    return this.funcionarioRepository.listar(nome);
  }
  
  async carregar(cpf: string): Promise<FuncionarioDTO> {
    const funcionario = await this.funcionarioRepository.carregar(cpf);

    if (!funcionario) {
      throw new BadRequestException('Funcionario não encontrado');
    }

    const retorno = new FuncionarioDTO();

    retorno.funcionario_beneficios = funcionario.f_recebe_b;

    delete funcionario.f_recebe_b;

    Object.assign(retorno, funcionario);

    return retorno;
  }

  async gravar(funcionario: FuncionarioDTO){
    const dados_db = await this.funcionarioRepository.carregar(funcionario.cpf);

    if(dados_db){
      throw new BadRequestException("CPF já existe na base de dados");
    }

    const dados: Prisma.funcionarioUncheckedCreateInput = {
      cpf: funcionario.cpf,
      salario: funcionario.salario,
      primeiro_nome: funcionario.primeiro_nome,
      sobrenome: funcionario.sobrenome,
      contrato: funcionario.contrato,
      cargo: funcionario.contrato,
      cnpj: funcionario.cnpj
    }

    const retorno = await this.funcionarioRepository.gravar(dados);
    
    if(funcionario.funcionario_beneficios && funcionario.funcionario_beneficios.length){
      await this.funcionarioBeneficioService.gravarMuitos(funcionario.funcionario_beneficios, retorno.cpf);
    }

    return this.carregar(funcionario.cpf);
  }

  async atualizar(
    funcionario: FuncionarioDTO,
    cpf: string,
  ) {
    const dados_db = await this.funcionarioRepository.carregar(cpf);

    if(!dados_db){
      throw new BadRequestException("Funcionario não encontrado");
    }
  
    const dados: Prisma.funcionarioUncheckedUpdateInput = {
      salario: funcionario.salario,
      primeiro_nome: funcionario.primeiro_nome,
      sobrenome: funcionario.sobrenome,
      contrato: funcionario.contrato,
      cargo: funcionario.contrato,
      cnpj: funcionario.cnpj
    };

    if(funcionario.funcionario_beneficios && funcionario.funcionario_beneficios.length){
      await this.funcionarioBeneficioService.movimentar(funcionario.funcionario_beneficios, dados_db.f_recebe_b, dados_db.cpf);
    }
    
    return this.carregar(dados_db.cpf);
  }


  async remover(cpf: string) {
    const registro = await this.funcionarioRepository.carregar(
      cpf,
    );

    try {
      await this.funcionarioRepository.remover(
        registro.cpf,
      );
    } catch (error) {
      throw new BadRequestException(
        'Este registro não pode ser removido pois possui registros relacionados a ele',
      );
    }
  }
}
