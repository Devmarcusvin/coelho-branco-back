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
import { ProductsService } from './products.service';
import { CreateProductDto } from './dto/create-product.dto';
import { UpdateProductDto } from './dto/update-product.dto';

@Controller('lojas/:lojaId/produtos')
export class ProductsController {
  constructor(private readonly productsService: ProductsService) {}

  @Post()
  create(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Body() dto: CreateProductDto,
  ) {
    return this.productsService.create(lojaId, dto);
  }

  @Get()
  findAll(@Param('lojaId', ParseIntPipe) lojaId: number) {
    return this.productsService.findAll(lojaId);
  }

  @Get(':id')
  findOne(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.productsService.findOne(lojaId, id);
  }

  @Patch(':id')
  update(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateProductDto,
  ) {
    return this.productsService.update(lojaId, id, dto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.OK)
  remove(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.productsService.remove(lojaId, id);
  }
}