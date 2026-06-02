import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAvaliacaoProdutoDto } from './dto/create-avaliacao-produto.dto';
import { UpdateAvaliacaoProdutoDto } from './dto/update-avaliacao-produto.dto';

@Injectable()
export class AvaliacoesProdutoService {
  constructor(private prisma: PrismaService) {}

  create(produtoId: number, dto: CreateAvaliacaoProdutoDto) {
    return this.prisma.avaliacoes_produto.create({
      data: { produto_id: produtoId, ...dto },
    });
  }

  findAll(produtoId: number) {
    return this.prisma.avaliacoes_produto.findMany({
      where: { produto_id: produtoId },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findOne(produtoId: number, id: number) {
    const avaliacao = await this.prisma.avaliacoes_produto.findFirst({
      where: { id, produto_id: produtoId },
    });
    if (!avaliacao) throw new NotFoundException(`Avaliação ${id} não encontrada.`);
    return avaliacao;
  }

  async update(produtoId: number, id: number, dto: UpdateAvaliacaoProdutoDto) {
    await this.findOne(produtoId, id);
    return this.prisma.avaliacoes_produto.update({
      where: { id },
      data: dto,
    });
  }

  async remove(produtoId: number, id: number) {
    await this.findOne(produtoId, id);
    await this.prisma.avaliacoes_produto.delete({ where: { id } });
    return { message: 'Avaliação do produto removida com sucesso.' };
  }
}