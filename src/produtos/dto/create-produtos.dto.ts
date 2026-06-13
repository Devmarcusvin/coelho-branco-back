import {
  IsString,
  IsNotEmpty,
  IsNumber,
  IsInt,
  IsOptional,
  Min,
  MaxLength,
} from 'class-validator';
import { Type } from 'class-transformer';
 
export class CreateProdutosDto {
  @IsString()
  @IsNotEmpty()
  @MaxLength(255)
  nome: string;

  @IsOptional()
  @IsString()
  descricao?: string;

  @IsNumber({ maxDecimalPlaces: 2 })
  @Min(0)
  @Type(() => Number)
  preco: number;

  @IsInt()
  @Min(0)
  @Type(() => Number)
  estoque: number;

  @IsInt()
  @Type(() => Number)
  categoria_id: number;
}
