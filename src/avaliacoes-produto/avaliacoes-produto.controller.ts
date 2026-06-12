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
  UnauthorizedException,
} from '@nestjs/common';
import { AvaliacoesProdutoService } from './avaliacoes-produto.service';
import { CreateAvaliacaoProdutoDto } from './dto/create-avaliacao-produto.dto';
import { UpdateAvaliacaoProdutoDto } from './dto/update-avaliacao-produto.dto';
import { Public } from "../auth/decorators/isPublic.decorator";
import { CurrentUser } from '../auth/decorators/CurrentUser.decorator';
import { UserPayload } from '../auth/types/UserPayload';

@Controller('produtos/:produtoId/avaliacoes')
export class AvaliacoesProdutoController {
  constructor(
    private readonly avaliacoesProdutoService: AvaliacoesProdutoService,
  ) {}

@Post()
create(
  @Param('produtoId', ParseIntPipe) produtoId: number,
  @Body() dto: CreateAvaliacaoProdutoDto,
  @CurrentUser() currentUser: UserPayload,
) {
  return this.avaliacoesProdutoService.create(produtoId, dto, currentUser.sub);
}

  @Public()
  @Get()
  findAll(@Param('produtoId', ParseIntPipe) produtoId: number) {
    return this.avaliacoesProdutoService.findAll(produtoId);
  }

  @Public()
  @Get(':id')
  findOne(
    @Param('produtoId', ParseIntPipe) produtoId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.avaliacoesProdutoService.findOne(produtoId, id);
  }

  @Patch(':id')
  update(
    @Param('produtoId', ParseIntPipe) produtoId: number,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateAvaliacaoProdutoDto,
  ) {
    return this.avaliacoesProdutoService.update(produtoId, id, dto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  remove(
    @Param('produtoId', ParseIntPipe) produtoId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.avaliacoesProdutoService.remove(produtoId, id);
  }
}