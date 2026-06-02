export class CreateLojaDto {
  usuario_id!: number;
  nome!: string;
  descricao?: string;
  logo_url?: string;
  banner_url?: string;
  sticker_url?: string;
}

/*
model lojas {
  id                   Int                     @id @default(autoincrement())
  usuario_id           Int
  nome                 String                  @db.VarChar(255)
  descricao            String?
  logo_url             String?                 @db.VarChar(255)
  banner_url           String?                 @db.VarChar(255)
  sticker_url          String?                 @db.VarChar(255)
  createdAt            DateTime                @default(now())
  updatedAt            DateTime                @updatedAt

  usuario              usuarios                @relation(fields: [usuario_id], references: [id])

  produtos             produtos[]
  avaliacoes_loja      avaliacoes_loja[]
}

*/