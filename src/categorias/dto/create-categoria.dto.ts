export class CreateCategoriaDto {
    nome!: string;
    categoria_pai_id?: number;
}


/*
model categorias {
  id                   Int                     @id @default(autoincrement())
  nome                 String                  @db.VarChar(100)
  categoria_pai_id     Int?

  categoriaPai         categorias?             @relation("CategoriaPai", fields: [categoria_pai_id], references: [id])
  subcategorias        categorias[]            @relation("CategoriaPai")

  produtos             produtos[]
}
*/