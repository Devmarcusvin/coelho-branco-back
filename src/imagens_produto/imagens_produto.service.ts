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

async findByUsuario(usuarioId: number) {
  return this.prisma.imagens_produto.findMany({
    where: {
      produto: {
        loja: {
          usuario_id: usuarioId,
        },
      },
    },
    orderBy: { ordem: 'asc' },
    include: {
      produto: { select: { id: true, nome: true, loja_id: true } },
    },
  });
}

  async remove(id: number){
    await this.findOne(id);
    await this.prisma.imagens_produto.delete({where: { id}});
    return {message: 'Imagem removida com sucesso.'}
  }
}
