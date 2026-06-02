import { Injectable } from '@nestjs/common';
import { CreateLojaDto } from './dto/create-loja.dto';
import { PrismaService } from '../prisma/prisma.service';

@Injectable()
export class LojasService {
  constructor(private prisma: PrismaService){}
  
  async create(data: CreateLojaDto) {
    const loja = await this.prisma.lojas.create ({
      data
    })
    return loja;
  }


  async findAll() {
    return this.prisma.lojas.findMany();
  }

  async update(id: number, data: CreateLojaDto){
    const lojaexists = await this.prisma.lojas.findUnique({
      where: {id}
    });
    if(!lojaexists){
      throw new Error("Loja não encontrada");
    }
    return await this.prisma.lojas.update({
      data,
      where: {id}
    });
  }

  async delete(id: number){
    const lojaexists = await this.prisma.lojas.findUnique({
      where: {id}
    });
    if(!lojaexists){
      throw new Error("Loja não encontrada");
    }
    return await this.prisma.lojas.delete({
      where: {id}
    });
  }

  async findOne(id: number){
    const lojaexists = await this.prisma.lojas.findUnique({
      where: {id}
    });
    if(!lojaexists){
      throw new Error("Loja não encontrada");
    }
    return lojaexists;
  }
}