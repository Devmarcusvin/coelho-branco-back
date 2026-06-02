import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateAvaliacaoLojaDto } from './dto/create-avaliacao-loja.dto';
import { UpdateAvaliacaoLojaDto } from './dto/update-avaliacao-loja.dto';

export interface AvaliacaoLoja {
  id: number;
  usuario_id: number;
  loja_id: number;
  nota: number;
  comentario?: string;
  createdAt: Date;
  updatedAt: Date;
}

@Injectable()
export class AvaliacoesLojaService {
  private avaliacoes: AvaliacaoLoja[] = [];

  private nextId = 1;

  create(lojaId: number, dto: CreateAvaliacaoLojaDto): AvaliacaoLoja {
    const novaAvaliacao: AvaliacaoLoja = {
      id: this.nextId++,
      loja_id: lojaId,
      ...dto,
      createdAt: new Date(),
      updatedAt: new Date(),
    };

    this.avaliacoes.push(novaAvaliacao);
    return novaAvaliacao;
  }

  findAll(lojaId: number): AvaliacaoLoja[] {
    return this.avaliacoes
      .filter((a) => a.loja_id === lojaId)
      .sort((a, b) => b.createdAt.getTime() - a.createdAt.getTime());
  }

  findOne(lojaId: number, id: number): AvaliacaoLoja {
    const avaliacao = this.avaliacoes.find(
      (a) => a.id === id && a.loja_id === lojaId,
    );

    if (!avaliacao) {
      throw new NotFoundException(`Avaliação ${id} não encontrada.`);
    }

    return avaliacao;
  }

  update(
    lojaId: number,
    id: number,
    dto: UpdateAvaliacaoLojaDto,
  ): AvaliacaoLoja {
    const avaliacao = this.findOne(lojaId, id);

    Object.assign(avaliacao, dto, { updatedAt: new Date() });

    return avaliacao;
  }

  remove(lojaId: number, id: number): { message: string } {
    this.findOne(lojaId, id);

    this.avaliacoes = this.avaliacoes.filter(
      (a) => !(a.id === id && a.loja_id === lojaId),
    );

    return { message: 'Avaliação da loja removida com sucesso.' };
  }
}