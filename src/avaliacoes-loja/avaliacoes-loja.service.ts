import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAvaliacaoLojaDto } from './dto/create-avaliacao-loja.dto';
import { UpdateAvaliacaoLojaDto } from './dto/update-avaliacao-loja.dto';

@Injectable()
export class AvaliacoesLojaService {
  constructor(private prisma: PrismaService) {}

  create(lojaId: number, dto: CreateAvaliacaoLojaDto) {
    return this.prisma.avaliacoes_loja.create({
      data: { loja_id: lojaId, ...dto },
    });
  }

  findAll(lojaId: number) {
    return this.prisma.avaliacoes_loja.findMany({
      where: { loja_id: lojaId },
      orderBy: { createdAt: 'desc' },
    });
  }

  async findOne(lojaId: number, id: number) {
    const avaliacao = await this.prisma.avaliacoes_loja.findFirst({
      where: { id, loja_id: lojaId },
    });
    if (!avaliacao) throw new NotFoundException(`Avaliação ${id} não encontrada.`);
    return avaliacao;
  }

  async update(lojaId: number, id: number, dto: UpdateAvaliacaoLojaDto) {
    await this.findOne(lojaId, id);
    return this.prisma.avaliacoes_loja.update({
      where: { id },
      data: dto,
    });
  }

  async remove(lojaId: number, id: number) {
    await this.findOne(lojaId, id);
    await this.prisma.avaliacoes_loja.delete({ where: { id } });
    return { message: 'Avaliação da loja removida com sucesso.' };
  }
}