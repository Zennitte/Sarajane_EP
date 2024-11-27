import { ApiProperty } from "@nestjs/swagger";
import { beneficio } from "@prisma/client";

export class BeneficioDTO implements beneficio{
    @ApiProperty()
    idbenef: number;  

    @ApiProperty()
    tipo: string;
  
    @ApiProperty()
    desconto: number;
  
    @ApiProperty()
    valor: number;
}
