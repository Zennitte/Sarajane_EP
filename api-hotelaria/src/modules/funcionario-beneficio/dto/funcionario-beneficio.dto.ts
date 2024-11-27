import { ApiProperty } from "@nestjs/swagger";
import { f_recebe_b, funcionario } from "@prisma/client";

export class FuncionarioBeneficioDTO implements f_recebe_b{
    @ApiProperty()
    idbenef: number;

    @ApiProperty()
    cpf: string;
}