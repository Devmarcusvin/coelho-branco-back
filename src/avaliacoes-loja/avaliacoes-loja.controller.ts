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
import { AvaliacoesLojaService } from './avaliacoes-loja.service';
import { CreateAvaliacaoLojaDto } from './dto/create-avaliacao-loja.dto';
import { UpdateAvaliacaoLojaDto } from './dto/update-avaliacao-loja.dto';
import {Public} from "../auth/decorators/isPublic.decorator";
import { CurrentUser } from '../auth/decorators/CurrentUser.decorator';
import { UserPayload } from '../auth/types/UserPayload';

@Controller('lojas/:lojaId/avaliacoes')
export class AvaliacoesLojaController {
  constructor(
    private readonly avaliacoesLojaService: AvaliacoesLojaService,
  ) {}

  @Post()
  create(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Body() dto: CreateAvaliacaoLojaDto,
    @CurrentUser() currentUser: UserPayload,
  ) {
    return this.avaliacoesLojaService.create(lojaId, dto, currentUser.sub);
  }

  @Public()
  @Get()
  findAll(@Param('lojaId', ParseIntPipe) lojaId: number) {
    return this.avaliacoesLojaService.findAll(lojaId);
  }

  @Public()
  @Get(':id')
  findOne(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.avaliacoesLojaService.findOne(lojaId, id);
  }

  @Patch(':id')
  update(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
    @Body() dto: UpdateAvaliacaoLojaDto,
  ) {
    return this.avaliacoesLojaService.update(lojaId, id, dto);
  }

  @Delete(':id')
  @HttpCode(HttpStatus.NO_CONTENT)
  remove(
    @Param('lojaId', ParseIntPipe) lojaId: number,
    @Param('id', ParseIntPipe) id: number,
  ) {
    return this.avaliacoesLojaService.remove(lojaId, id);
  }
}