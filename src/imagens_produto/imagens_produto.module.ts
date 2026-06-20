import { Module } from '@nestjs/common';
import { ImagensProdutoService } from './imagens_produto.service';
import { ImagensProdutoController } from './imagens_produto.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [ImagensProdutoController],
  providers: [ImagensProdutoService],
})
export class ImagensProdutoModule {}
