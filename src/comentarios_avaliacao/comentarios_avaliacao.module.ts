import { Module } from '@nestjs/common';
import { ComentariosAvaliacaoService } from './comentarios_avaliacao.service';
import { ComentariosAvaliacaoController } from './comentarios_avaliacao.controller';
import { PrismaModule } from '../prisma/prisma.module';

@Module({
  imports: [PrismaModule],
  controllers: [ComentariosAvaliacaoController],
  providers: [ComentariosAvaliacaoService],
})
export class ComentariosAvaliacaoModule {}