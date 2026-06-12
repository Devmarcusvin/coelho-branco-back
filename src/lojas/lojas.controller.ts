import { Controller, Get, Post, Put, Body, Patch, Param, Delete } from '@nestjs/common';
import { LojasService } from './lojas.service';
import { CreateLojaDto } from './dto/create-loja.dto';
import {Public} from "../auth/decorators/isPublic.decorator";
import { UserPayload } from '../auth/types/UserPayload';
import { CurrentUser } from '../auth/decorators/CurrentUser.decorator';

@Controller('lojas')
export class LojasController {
  constructor(private readonly lojasService: LojasService) {}

  @Post('create')
  create(@Body() data: CreateLojaDto, @CurrentUser() currentUser: UserPayload) {
    return this.lojasService.create(data, currentUser.sub);
  }

  @Public()
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

  @Public()
  @Get(':id')
  async findOne(@Param('id') id:number){
    return this.lojasService.findOne(Number(id));
  }
}