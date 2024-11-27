import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { BeneficioModule } from './modules/beneficio/beneficio.module';
import { FuncionarioModule } from './modules/funcionario/funcionario.module';

@Module({
  imports: [BeneficioModule, FuncionarioModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
