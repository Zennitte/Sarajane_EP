
import {
  Controller,
  Get,
  Body,
  Post,
  Param,
  Put,
  Delete,
} from '@nestjs/common';
import { FuncionarioService } from './funcionario.service';
import { FuncionarioDTO } from './dto/funcionario.dto';
import { ApiOkResponse, ApiParam } from '@nestjs/swagger';

@Controller('funcionario')
export class FuncionarioController {
  constructor(
    private readonly funcionarioService: FuncionarioService,
  ) {}

  @ApiOkResponse({type: [FuncionarioDTO]})
  @ApiParam({ name: 'nome', description: 'Primeiro nome ou sobrenome do funcionário', type: String, required: false, allowEmptyValue: true  })
  @Get('listar/:nome?')
  async Pesquisar(@Param('nome') nome: string): Promise<any> {
    return this.funcionarioService.listar(nome);
  }

  @ApiOkResponse({type: FuncionarioDTO})
  @Get('carregar/:cpf')
  async carregar(@Param('cpf') cpf: string): Promise<FuncionarioDTO>{
    return this.funcionarioService.carregar(cpf);
  }

  @ApiOkResponse({type: FuncionarioDTO})
  @Post()
  async gravar(@Body() body: FuncionarioDTO) {
    return await this.funcionarioService.gravar(body);
  }

  @ApiOkResponse({type: FuncionarioDTO})
  @Put(':cpf')
  async atualizar(@Body() body: FuncionarioDTO, @Param('cpf') cpf: string) {
    return await this.funcionarioService.atualizar(
      body,
      cpf,
    );
  }

  @Delete(':cpf')
  async remover(@Param('cpf') cpf: string) {
    return await this.funcionarioService.remover(cpf);
  }
}
