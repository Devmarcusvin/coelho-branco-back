import { Controller, Get, Post, Put, Body, Patch, Param, Delete } from '@nestjs/common';
import { LojasService } from './lojas.service';
import { CreateLojaDto } from './dto/create-loja.dto';

@Controller('lojas')
export class LojasController {
  constructor(private readonly lojasService: LojasService) {}

  @Post('create')
  create(@Body() data: CreateLojaDto) {
    return this.lojasService.create(data);
  }

  @Get()
  async findAll(){
    return this.lojasService.findAll();
  }
  
  @Put(':id')
  async update(@Param('id') id: number, @Body() data: CreateLojaDto){
    return this.lojasService.update(Number(id), data);
  }

  @Delete(':id')
  async delete(@Param('id') id:number){
    return this.lojasService.delete(Number(id));
  }

  @Get(':id')
  async findOne(@Param('id') id:number){
    return this.lojasService.findOne(Number(id));
  }
}