import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import * as bcrypt from 'bcrypt'; // ← adiciona esse import

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  async create(createUserDto: CreateUserDto) {
  const senha_hash = await bcrypt.hash(createUserDto.senha, 10);

  return this.prisma.usuarios.create({
    data: {
      nome: createUserDto.name,
      email: createUserDto.email,
      username: createUserDto.username,
      senha_hash,
      foto_perfil_url: createUserDto.foto_perfil_url,
    },
  });
}
  findAll() {
    return this.prisma.usuarios.findMany();
  }

  findOne(id: number) {
    return this.prisma.usuarios.findUnique({ where: { id } });
  }

  findByEmail(email: string){
    return this.prisma.usuarios.findUnique({where: { email }});
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return this.prisma.usuarios.update({ where: { id }, data: updateUserDto });
  }

  remove(id: number) {
    return this.prisma.usuarios.delete({ where: { id } });
  }
}