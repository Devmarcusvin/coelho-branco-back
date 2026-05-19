import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';

@Injectable()
export class ProductsService {
  constructor(private readonly prisma: PrismaService) {}

  async create(lojaId: number, dto: CreateProductDto) {
    return this.prisma.produtos.create({
      data: {
        ...dto,
        loja_id: lojaId,
      },
    });
  }

  async findAll(lojaId: number) {
    return this.prisma.produtos.findMany({
      where: { loja_id: lojaId },
      orderBy: { createdAt: 'desc' },
      include: { imagens: true, categoria: true },
    });
  }

  async findOne(lojaId: number, id: number) {
    const product = await this.prisma.produtos.findFirst({
      where: { id, loja_id: lojaId },
      include: { imagens: true, categoria: true },
    });

    if (!product) {
      throw new NotFoundException(`Produto ${id} não encontrado.`);
    }

    return product;
  }

  async update(lojaId: number, id: number, dto: UpdateProductDto) {
    await this.findOne(lojaId, id);

    return this.prisma.produtos.update({
      where: { id },
      data: dto,
    });
  }

  // US28 / RF36 — remover produto da loja
  async remove(lojaId: number, id: number) {
    await this.findOne(lojaId, id);

    await this.prisma.produtos.delete({
      where: { id },
    });

    return { message: 'Produto removido da loja com sucesso.' };
  }
}