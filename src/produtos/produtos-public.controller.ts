import { Controller, Get, Query } from '@nestjs/common';
import { ProdutosService } from './produtos.service';
import { Public } from '../auth/decorators/isPublic.decorator';

@Controller('produtos')
export class ProdutosPublicController {
  constructor(private readonly produtosService: ProdutosService) {}

  @Public()
  @Get()
  findAllByCategoria(@Query('categoria') categoria?: string) {
    return this.produtosService.findAllByCategoria(categoria);
  }
}