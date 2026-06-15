import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { ProdutosModule } from './produtos/produtos.module';
import { AvaliacoesProdutoModule } from './avaliacoes-produto/avaliacoes-produto.module';
import { AvaliacoesLojaModule } from './avaliacoes-loja/avaliacoes-loja.module';
import { CategoriasModule } from './categorias/categorias.module';
import { LojasModule } from './lojas/lojas.module';
import { UsersModule } from './users/users.module'
import { ComentariosAvaliacaoModule } from './comentarios_avaliacao/comentarios_avaliacao.module';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    PrismaModule,
    ProdutosModule,
    AvaliacoesProdutoModule,
    AvaliacoesLojaModule,
    CategoriasModule,
    LojasModule,
    UsersModule,
    ComentariosAvaliacaoModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}