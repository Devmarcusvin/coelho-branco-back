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

  return this.prisma.user.create({
    data: {
      name: createUserDto.name,
      email: createUserDto.email,
      username: createUserDto.username,
      password: senha_hash,
      foto_perfil_url: createUserDto.foto_perfil_url,
    },
  });
}
  findAll() {
    return this.prisma.user.findMany();
  }

  findOne(id: number) {
    return this.prisma.user.findUnique({ where: { id } });
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return this.prisma.user.update({ where: { id }, data: updateUserDto });
  }

  remove(id: number) {
    return this.prisma.user.delete({ where: { id } });
  }
}