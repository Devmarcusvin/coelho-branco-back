import { Module } from '@nestjs/common';
import { ProdutosController } from './produtos.controller';
import { ProdutosPublicController } from './produtos-public.controller';
import { ProdutosService } from './produtos.service';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [ProdutosController, ProdutosPublicController],
  providers: [ProdutosService],
})
export class ProdutosModule {}