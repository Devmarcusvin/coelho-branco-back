import { Controller, Get, Post, Body, Patch, Param, UnauthorizedException, Delete, UseInterceptors, UploadedFile } from '@nestjs/common';
import { FileInterceptor } from '@nestjs/platform-express';
import { diskStorage } from 'multer';
import { extname } from 'path';
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

  //rota de upload de avatar
  @Post(':id/avatar')
  @UseInterceptors(
    FileInterceptor('file', {
      storage: diskStorage({
        destination: './uploads/avatars',
        filename: (req, file, callback) => {
          const uniqueSuffix = Date.now() + '-' + Math.round(Math.random() * 1e9);
          const ext = extname(file.originalname);
          callback(null, `avatar-${uniqueSuffix}${ext}`);
        },
      }),
    }),
  )
  async uploadAvatar(
    @Param('id') id: string,
    @UploadedFile() file: Express.Multer.File,
  ) {
    const url = `http://localhost:3333/uploads/avatars/${file.filename}`;
    return this.usersService.update(+id, { foto_perfil_url: url });
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