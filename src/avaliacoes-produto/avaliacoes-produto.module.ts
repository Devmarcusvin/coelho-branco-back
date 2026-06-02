import { Module } from '@nestjs/common';
import { AvaliacoesProdutoService } from './avaliacoes-produto.service';
import { AvaliacoesProdutoController } from './avaliacoes-produto.controller';

@Module({
  controllers: [AvaliacoesProdutoController],
  providers: [AvaliacoesProdutoService],
})
export class AvaliacoesProdutoModule {}