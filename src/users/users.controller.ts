import { Controller, Get, Post, Body, Patch, Param, UnauthorizedException, Delete } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import * as bcrypt from 'bcrypt';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) { }

  @Post()
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  //rota de login
  @Post('login')
  async login(@Body() body: { email: string; senha: string }) {
    const usuario = await this.usersService.findByEmail(body.email);
    if (!usuario) throw new UnauthorizedException('Credenciais inválidas');

    const senhaCorreta = await bcrypt.compare(body.senha, usuario.senha_hash);
    if (!senhaCorreta) throw new UnauthorizedException('Credenciais inválidas');
    const { senha_hash, ...dados } = usuario;
    return dados;
  }

  @Get()
  findAll() {
    return this.usersService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.usersService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
    return this.usersService.update(+id, updateUserDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.usersService.remove(+id);
  }
}
