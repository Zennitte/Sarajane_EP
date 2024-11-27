
import {
  Controller,
  Get,
  Body,
  Post,
  Param,
  Put,
  Delete,
} from '@nestjs/common';
import { BeneficioService } from './beneficio.service';
import { BeneficioDTO } from './dto/beneficio.dto';
import { ApiOkResponse, ApiParam } from '@nestjs/swagger';

@Controller('beneficio')
export class BeneficioController {
  constructor(
    private readonly beneficioService: BeneficioService,
  ) {}

  @ApiOkResponse({type: [BeneficioDTO]})
  @ApiParam({ name: 'tipo', description: 'Tipo do beneficio', type: String, required: false, allowEmptyValue: true })
  @Get('listar/:tipo?')
  async Pesquisar(@Param('tipo') tipo?: string): Promise<any> {
    return this.beneficioService.listar(tipo);
  }

  @ApiOkResponse({type: BeneficioDTO})
  @Get('carregar/:id')
  async carregar(@Param('id') id: number): Promise<BeneficioDTO>{
    return await this.beneficioService.carregar(+id);
  }

  @ApiOkResponse({type: BeneficioDTO})
  @Post()
  async gravar(@Body() body: BeneficioDTO) {
    return await this.beneficioService.gravar(body);
  }

  @ApiOkResponse({type: BeneficioDTO})
  @Put(':id')
  async atualizar(@Body() body: BeneficioDTO, @Param('id') id: number) {
    return await this.beneficioService.atualizar(
      body,
      +id,
    );
  }

  @Delete(':id')
  async remover(@Param('id') id: number) {
    return await this.beneficioService.remover(+id);
  }
}
