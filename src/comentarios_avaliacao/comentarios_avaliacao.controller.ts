import { Controller, Get, Post, Body, Put, Param, Delete, Query } from '@nestjs/common';
import { ComentariosAvaliacaoService } from './comentarios_avaliacao.service';
import { PrismaService } from '../prisma/prisma.service';
import { CreateComentariosAvaliacaoDto } from './dto/create-comentarios_avaliacao.dto';

@Controller('comentarios-avaliacao')
export class ComentariosAvaliacaoController {
  constructor(private readonly comentariosAvaliacaoService: ComentariosAvaliacaoService) { }

  @Post()
  create(@Body() data: CreateComentariosAvaliacaoDto) {
    return this.comentariosAvaliacaoService.create(data);
  }

  @Get()
  async findAll() {
    return this.comentariosAvaliacaoService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: number) {
    return this.comentariosAvaliacaoService.findOne(+id);
  }

  //lista todos os comentários de um comentário original
  @Get('avaliacao')
  findByAvaliacao(
    @Query('avaliacao_loja_id') avaliacaoLojaId?: number,
    @Query('avaliacao_produto_id') avaliacaoProdutoId?: number,
  ) {
    return this.comentariosAvaliacaoService.findByAvaliacao(
      avaliacaoLojaId ? +avaliacaoLojaId : undefined,
      avaliacaoProdutoId ? +avaliacaoProdutoId : undefined,
    );
  }

  @Put(':id')
  async update(@Param('id') id: number, @Body() data: CreateComentariosAvaliacaoDto) {
    return this.comentariosAvaliacaoService.update(Number(id), data);
  }

  @Delete(':id')
  async remove(@Param('id') id: number) {
    return this.comentariosAvaliacaoService.remove(+id);
  }
}
