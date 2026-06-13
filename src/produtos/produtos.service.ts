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
    });
  }

  async findOne(lojaId: number, id: number) {
    const produto = await this.prisma.produtos.findFirst({
      where: { id, loja_id: lojaId },
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
}