import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ProductsModule } from './products/products.module';
import { AvaliacoesProdutoModule } from './avaliacoes-produto/avaliacoes-produto.module';
import { AvaliacoesLojaModule } from './avaliacoes-loja/avaliacoes-loja.module';

@Module({
  imports: [ProductsModule, AvaliacoesProdutoModule, AvaliacoesLojaModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}

