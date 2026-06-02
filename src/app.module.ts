import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { ProductsModule } from './products/products.module';
import { AvaliacoesProdutoModule } from './avaliacoes-produto/avaliacoes-produto.module';
import { AvaliacoesLojaModule } from './avaliacoes-loja/avaliacoes-loja.module';
import { CategoriasModule } from './categorias/categorias.module';
import { LojasModule } from './lojas/lojas.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    PrismaModule,
    ProductsModule,
    AvaliacoesProdutoModule,
    AvaliacoesLojaModule,
    CategoriasModule,
    LojasModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}