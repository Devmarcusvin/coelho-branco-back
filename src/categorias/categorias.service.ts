import { Injectable } from '@nestjs/common';
import { CreateCategoriaDto } from './dto/create-categoria.dto';
import { PrismaService } from '../prisma/prisma.service';


@Injectable()
export class CategoriasService {
constructor(private prisma: PrismaService){}
  
  async create(data: CreateCategoriaDto) {
    const categorias = await this.prisma.categorias.create ({
      data
    })
    return categorias;
  }


  async findAll() {
    return this.prisma.categorias.findMany();
  }

  async update(id: number, data: CreateCategoriaDto){
    const categoriasexists = await this.prisma.categorias.findUnique({
      where: {id}
    });
    if(!categoriasexists){
      throw new Error("Categoria não encontrada");
    }
    return await this.prisma.categorias.update({
      data,
      where: {id}
    });
  }

  async delete(id: number){
    const categoriasexists = await this.prisma.categorias.findUnique({
      where: {id}
    });
    if(!categoriasexists){
      throw new Error("Categoria não encontrada");
    }
    return await this.prisma.categorias.delete({
      where: {id}
    });
  }

  async findOne(id: number){
    const categoriasexists = await this.prisma.categorias.findUnique({
      where: {id}
    });
    if(!categoriasexists){
      throw new Error("Categoria não encontrada");
    }
    return categoriasexists;
  }
}
