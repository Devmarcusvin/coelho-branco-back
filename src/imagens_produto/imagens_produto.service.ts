import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateImagensProdutoDto } from './dto/create-imagens_produto.dto';
import { UpdateImagensProdutoDto } from './dto/update-imagens_produto.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class ImagensProdutoService {
  constructor(private prisma: PrismaService){}

  create(dto: CreateImagensProdutoDto){
    return this.prisma.imagens_produto.create({
      data: dto,
    });
  }

  findAll(){
  return this.prisma.imagens_produto.findMany({
    orderBy: { ordem: 'asc' },
  });
}

  async findOne(id: number){
    const imagem = await this.prisma.imagens_produto.findUnique({
      where: {id},
    });
    if(!imagem) throw new NotFoundException(`Imagem ${ id } não encontrada.`);
    return imagem;
  }

async update(id: number, dto: UpdateImagensProdutoDto){
  await this.findOne(id);
  return this.prisma.imagens_produto.update({
    where: {id},
    data: dto,
  });
}

  async remove(id: number){
    await this.findOne(id);
    await this.prisma.imagens_produto.delete({where: { id}});
    return {message: 'Imagem removida com sucesso.'}
  }
}
