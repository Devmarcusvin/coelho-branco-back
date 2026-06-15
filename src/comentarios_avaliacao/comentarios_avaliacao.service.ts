import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateComentariosAvaliacaoDto } from './dto/create-comentarios_avaliacao.dto';

@Injectable()
export class ComentariosAvaliacaoService {
  constructor(private prisma: PrismaService) {}

  create(dto: CreateComentariosAvaliacaoDto) {
    return this.prisma.comentarios_avaliacao.create({
      data: dto,
    });
  }

  findAll() {
    return this.prisma.comentarios_avaliacao.findMany({
      orderBy: { createdAt: 'desc' },
    });
  }
  

  async findOne(id: number) {
    const comentario = await this.prisma.comentarios_avaliacao.findUnique({
      where: { id },
    });
    if (!comentario) throw new NotFoundException(`Comentário ${id} não encontrado.`);
    return comentario;
  }

  //lista todos os comentários de um comentário original
  findByAvaliacao(avaliacaoLojaId?: number, avaliacaoProdutoId?: number) {
  return this.prisma.comentarios_avaliacao.findMany({
    where: {
      ...(avaliacaoLojaId && { avaliacao_loja_id: avaliacaoLojaId }),
      ...(avaliacaoProdutoId && { avaliacao_produto_id: avaliacaoProdutoId }),
    },
    orderBy: { createdAt: 'asc' }, //mostra do mais antigo ao mais novo 
  });
}

  async update(id: number, dto: CreateComentariosAvaliacaoDto) {
    await this.findOne(id);
    return this.prisma.comentarios_avaliacao.update({
      where: { id },
      data: dto,
    });
  }

  async remove(id: number) {
    await this.findOne(id);
    await this.prisma.comentarios_avaliacao.delete({ where: { id } });
    return { message: 'Comentário removido com sucesso.' };
  }

  
}