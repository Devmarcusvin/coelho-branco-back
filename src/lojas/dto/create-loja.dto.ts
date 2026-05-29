export class CreateLojaDto {
  usuario_id!: number;
  nome!: string;
  descricao?: string;
  logo_url?: string;
  banner_url?: string;
  sticker_url?: string;
}