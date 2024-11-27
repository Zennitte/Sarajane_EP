import { ApiProperty } from "@nestjs/swagger";
import { funcionario } from "@prisma/client";
import { FuncionarioBeneficioDTO } from "src/modules/funcionario-beneficio/dto/funcionario-beneficio.dto";

export class FuncionarioDTO implements funcionario{
    @ApiProperty()
    cpf: string;

    @ApiProperty()
    salario: number;

    @ApiProperty()
    primeiro_nome: string;

    @ApiProperty()
    sobrenome: string;

    @ApiProperty()
    contrato: string;

    @ApiProperty()
    cargo: string;

    @ApiProperty()
    cnpj: string;

    @ApiProperty({type: [FuncionarioBeneficioDTO]})
    funcionario_beneficios: FuncionarioBeneficioDTO[];
}