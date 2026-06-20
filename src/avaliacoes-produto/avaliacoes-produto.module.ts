import { Module } from '@nestjs/common';
import { AvaliacoesProdutoService } from './avaliacoes-produto.service';
import { AvaliacoesProdutoController } from './avaliacoes-produto.controller';
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [AvaliacoesProdutoController],
  providers: [AvaliacoesProdutoService, PrismaService],
})
export class AvaliacoesProdutoModule {}