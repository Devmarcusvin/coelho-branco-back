// src/lojas/lojas.service.ts
import { Injectable } from '@nestjs/common';
import { CreateLojaDto } from './dto/create-loja.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class LojasService {
  constructor(private prisma: PrismaService) {}

  async create(data: CreateLojaDto, usuarioId: number) {
    return this.prisma.lojas.create({
      data: { ...data, usuario_id: usuarioId },
    });
  }

  async findAll() {
    return this.prisma.lojas.findMany();
  }

  async update(id: number, data: CreateLojaDto) {
    const lojaexists = await this.prisma.lojas.findUnique({ where: { id } });
    if (!lojaexists) throw new Error('Loja não encontrada');
    return this.prisma.lojas.update({ data, where: { id } });
  }

  async delete(id: number) {
    const lojaexists = await this.prisma.lojas.findUnique({ where: { id } });
    if (!lojaexists) throw new Error('Loja não encontrada');
    return this.prisma.lojas.delete({ where: { id } });
  }

  // inclui usuario e as avaliações pra calcular a média
  async findOne(id: number) {
    const loja = await this.prisma.lojas.findUnique({
      where: { id },
      include: {
        usuario: { select: { nome: true } },
        avaliacoes_loja: { select: { nota: true } },
      },
    });
    if (!loja) throw new Error('Loja não encontrada');

    const { avaliacoes_loja, ...resto } = loja;
    const totalAvaliacoes = avaliacoes_loja.length;
    const notaMedia = totalAvaliacoes
      ? avaliacoes_loja.reduce((acc, a) => acc + a.nota, 0) / totalAvaliacoes
      : 0;

    return { ...resto, notaMedia, totalAvaliacoes };
  }

  findByCategoria(categoriaId: number) {
    return this.prisma.lojas.findMany({
      where: { produtos: { some: { categoria_id: categoriaId } } },
      include: { produtos: { where: { categoria_id: categoriaId } } },
    });
  }
}