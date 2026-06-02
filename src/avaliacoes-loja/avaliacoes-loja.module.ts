import { Module } from '@nestjs/common';
import { AvaliacoesLojaService } from './avaliacoes-loja.service';
import { AvaliacoesLojaController } from './avaliacoes-loja.controller';

@Module({
  controllers: [AvaliacoesLojaController],
  providers: [AvaliacoesLojaService],
})
export class AvaliacoesLojaModule {}