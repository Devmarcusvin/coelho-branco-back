import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateAvaliacaoProdutoDto } from './dto/create-avaliacao-produto.dto';
import { UpdateAvaliacaoProdutoDto } from './dto/update-avaliacao-produto.dto';

export interface AvaliacaoProduto {
  id: number;
  usuario_id: number;
  produto_id: number;
  nota: number;
  comentario?: string;
  createdAt: Date;
  updatedAt: Date;
}

@Injectable()
export class AvaliacoesProdutoService {
  private avaliacoes: AvaliacaoProduto[] = [];

  private nextId = 1;

  create(produtoId: number, dto: CreateAvaliacaoProdutoDto): AvaliacaoProduto {
    const novaAvaliacao: AvaliacaoProduto = {
      id: this.nextId++,
      produto_id: produtoId,
      ...dto,
      createdAt: new Date(),
      updatedAt: new Date(),
    };

    this.avaliacoes.push(novaAvaliacao);
    return novaAvaliacao;
  }

  findAll(produtoId: number): AvaliacaoProduto[] {
    return this.avaliacoes
      .filter((a) => a.produto_id === produtoId)
      .sort((a, b) => b.createdAt.getTime() - a.createdAt.getTime());
  }

  findOne(produtoId: number, id: number): AvaliacaoProduto {
    const avaliacao = this.avaliacoes.find(
      (a) => a.id === id && a.produto_id === produtoId,
    );

    if (!avaliacao) {
      throw new NotFoundException(`Avaliação ${id} não encontrada.`);
    }

    return avaliacao;
  }

  update(
    produtoId: number,
    id: number,
    dto: UpdateAvaliacaoProdutoDto,
  ): AvaliacaoProduto {
    const avaliacao = this.findOne(produtoId, id);

    Object.assign(avaliacao, dto, { updatedAt: new Date() });

    return avaliacao;
  }

  remove(produtoId: number, id: number): { message: string } {
    this.findOne(produtoId, id);

    this.avaliacoes = this.avaliacoes.filter(
      (a) => !(a.id === id && a.produto_id === produtoId),
    );

    return { message: 'Avaliação do produto removida com sucesso.' };
  }
}