export class CreateUserDto {
  name!: string;
  email!: string;
  username!: string;
  senha!: string;
  foto_perfil_url?: string;
}