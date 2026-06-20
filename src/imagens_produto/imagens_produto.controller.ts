import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ImagensProdutoService } from './imagens_produto.service';
import { CreateImagensProdutoDto } from './dto/create-imagens_produto.dto';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateImagensProdutoDto } from './dto/update-imagens_produto.dto';

@Controller('imagens-produto')
export class ImagensProdutoController {
  constructor(private readonly imagensProdutoService: ImagensProdutoService) { }

  @Post()
  create(@Body() createImagensProdutoDto: CreateImagensProdutoDto) {
    return this.imagensProdutoService.create(createImagensProdutoDto);
  }

  @Get()
  async findAll() {
    return this.imagensProdutoService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: string) {
    return this.imagensProdutoService.findOne(+id);
  }

  @Patch(':id')
  async update(@Param('id') id: string, @Body() dto: UpdateImagensProdutoDto) {
    return this.imagensProdutoService.update(+id, dto);
  }

  @Delete(':id')
  async remove(@Param('id') id: string) {
    return this.imagensProdutoService.remove(+id);
  }
}
