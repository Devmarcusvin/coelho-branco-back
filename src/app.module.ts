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
import { UsersModule } from './users/users.module'
import { AuthModule } from './auth/auth.module';
import { APP_GUARD } from '@nestjs/core';
import { AuthGuard } from './auth/guards/auth-guard';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [
    ConfigModule.forRoot({ isGlobal: true }),
    PrismaModule,
    ProductsModule,
    AvaliacoesProdutoModule,
    AvaliacoesLojaModule,
    CategoriasModule,
    LojasModule,
    UsersModule,
    AuthModule,
    JwtModule,
    AuthModule
  ],
  controllers: [AppController],
  providers: [AppService, 
    {provide: APP_GUARD,
    useClass: AuthGuard,},
],
})
export class AppModule {}