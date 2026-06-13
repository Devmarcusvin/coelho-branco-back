import {
  Controller,
  Get,
  Post,
  Patch,
  Delete,
  Body,
  Param,
  ParseIntPipe,
  HttpCode,
  HttpStatus,
} from '@nestjs/common';
import { ProdutosService } from './produtos.service';
import { CreateProdutosDto } from './dto/create-produtos.dto';
import { UpdateProdutosDto } from './dto/update-produtos.dto';

@Controller('lojas/:lojaId/produtos')
export class ProdutosController {
  constructor(private readonly produtosService: ProdutosService) {}

  @Post()
  create(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Body() dto: CreateProdutosDto,
  ) {
    return this.produtosService.create(lojaId, dto);
  }

  @Get()
  findAll(@Param('lojaId', ParseIntPipe) lojaId: number) {
    return this.produtosService.findAll(lojaId);
  }

  @Get(':id')
  findOne(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.produtosService.findOne(lojaId, id);
  }

  @Patch(':id')
  update(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateProdutosDto,
  ) {
    return this.produtosService.update(lojaId, id, dto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  remove(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.produtosService.remove(lojaId, id);
  }
}