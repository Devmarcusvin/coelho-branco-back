import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';

export interface Product {
  id: number;
  loja_id: number;
  nome: string;
  descricao?: string;
  preco: number;
  estoque: number;
  categoria_id: number;
  createdAt: Date;
}

@Injectable()
export class ProductsService {
  private produtos: Product[] = [];
  private nextId = 1;

  create(lojaId: number, dto: CreateProductDto) {
    const produto: Product = {
      id: this.nextId++,
      loja_id: lojaId,
      createdAt: new Date(),
      ...dto,
    };
    this.produtos.push(produto);
    return produto;
  }

  findAll(lojaId: number) {
    return this.produtos
      .filter((p) => p.loja_id === lojaId)
      .sort((a, b) => new Date(b.createdAt).getTime() - new Date(a.createdAt).getTime());
  }

  findOne(lojaId: number, id: number) {
    const produto = this.produtos.find(
      (p) => p.id === id && p.loja_id === lojaId,
    );

    if (!produto) {
      throw new NotFoundException(`Produto ${id} não encontrado.`);
    }

    return produto;
  }

  update(lojaId: number, id: number, dto: UpdateProductDto) {
    const produto = this.findOne(lojaId, id);
    Object.assign(produto, dto);
    return produto;
  }

  remove(lojaId: number, id: number) {
    this.findOne(lojaId, id);
    this.produtos = this.produtos.filter(
      (p) => !(p.id === id && p.loja_id === lojaId),
    );
    return { message: 'Produto removido da loja com sucesso.' };
  }
}