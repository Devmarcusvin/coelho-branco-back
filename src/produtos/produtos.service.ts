import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateProdutosDto } from './dto/create-produtos.dto';
import { UpdateProdutosDto } from './dto/update-produtos.dto';

@Injectable()
export class ProdutosService {
  constructor(private prisma: PrismaService) {}

  create(lojaId: number, dto: CreateProdutosDto) {
    return this.prisma.produtos.create({
      data: { loja_id: lojaId, ...dto },
    });
  }

  findAll(lojaId: number) {
    return this.prisma.produtos.findMany({
      where: { loja_id: lojaId },
      orderBy: { createdAt: 'desc' },
      include: {
        imagens: { orderBy: { ordem: 'asc' }, take: 1 },
        loja: { select: { logo_url: true } },
      },
    });
  }

  async findAllByCategoria(categoria?: string) {
    if (!categoria) {
      return this.prisma.produtos.findMany({
        orderBy: { createdAt: 'desc' },
        include: {
          imagens: { orderBy: { ordem: 'asc' }, take: 1 },
          loja: { select: { logo_url: true } },
          categoria: true,
        },
      });
    }

    const categoriaPai = await this.prisma.categorias.findFirst({
      where: { nome: { equals: categoria, mode: 'insensitive' } },
    });

    if (!categoriaPai) return [];

    const subcategorias = await this.prisma.categorias.findMany({
      where: { categoria_pai_id: categoriaPai.id },
    });

    const todosIds = [categoriaPai.id, ...subcategorias.map((s) => s.id)];

    return this.prisma.produtos.findMany({
      where: { categoria_id: { in: todosIds } },
      orderBy: { createdAt: 'desc' },
      include: {
        imagens: { orderBy: { ordem: 'asc' }, take: 1 },
        loja: { select: { logo_url: true } },
        categoria: true,
      },
    });
  }

  async findOne(lojaId: number, id: number) {
    const produto = await this.prisma.produtos.findFirst({
      where: { id, loja_id: lojaId },
      include: {
        imagens: { orderBy: { ordem: 'asc' } },
        avaliacoes: {
          orderBy: { createdAt: 'desc' },
          include: { usuario: true },
        },
        categoria: true,
        loja: true,
      },
    });
    if (!produto) throw new NotFoundException(`Produto ${id} não encontrado.`);
    return produto;
  }

  async update(lojaId: number, id: number, dto: UpdateProdutosDto) {
    await this.findOne(lojaId, id);
    return this.prisma.produtos.update({
      where: { id },
      data: dto,
    });
  }

  async remove(lojaId: number, id: number) {
    await this.findOne(lojaId, id);
    await this.prisma.produtos.delete({ where: { id } });
    return { message: 'Produto removido da loja com sucesso.' };
  }

  async findByCategoria(nomeCategoria: string) {
  const categoria = await this.prisma.categorias.findFirst({
    where: { nome: { equals: nomeCategoria, mode: 'insensitive' } },
    include: { subcategorias: true },
  });

  if (!categoria) return [];

  const categoriaIds = [categoria.id, ...categoria.subcategorias.map((s) => s.id)];

  return this.prisma.produtos.findMany({
    where: { categoria_id: { in: categoriaIds } },
    include: {
      imagens: { orderBy: { ordem: 'asc' }, take: 1 },
      loja: { select: { logo_url: true } },
    },
  });
}
}