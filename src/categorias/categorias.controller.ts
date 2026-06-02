import { Controller, Get, Post, Put, Body, Patch, Param, Delete } from '@nestjs/common';
import { CategoriasService } from './categorias.service';
import { CreateCategoriaDto } from './dto/create-categoria.dto';

@Controller('categorias')
export class CategoriasController {
  constructor(private readonly categoriasService: CategoriasService) {}

  @Post('create')
  create(@Body() data: CreateCategoriaDto) {
    return this.categoriasService.create(data);
  }

  @Get()
  async findAll() {
    return this.categoriasService.findAll();
  }

  @Put(':id')
    async update(@Param('id') id: number, @Body() data: CreateCategoriaDto){
      return this.categoriasService.update(Number(id), data);
    }


  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.categoriasService.findOne(Number(id));
  }


  @Delete(':id')
  async delete(@Param('id') id:number){
    return this.categoriasService.delete(Number(id));
  }
}
