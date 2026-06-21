import { Injectable, NotFoundException, UnauthorizedException } from '@nestjs/common';
import { UsersService } from '../users/users.service';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { UserToken } from './types/UserToken';
import { CreateAuthDto } from './dto/create-auth.dto';
import * as bcrypt from 'bcrypt';
import { PrismaService } from '../prisma/prisma.service';
import { UserPayload } from './types/UserPayload';


@Injectable()
export class AuthService {
  constructor(
    private readonly userService: UsersService,
    private readonly jwtService: JwtService,
    private readonly configService: ConfigService,
    private readonly prisma: PrismaService,
  ) { }

  async login(LoginRequestBody: CreateAuthDto): Promise<UserToken> {
    const user = await this.validateUser(LoginRequestBody.email, LoginRequestBody.senha);
    if (!user) {
      throw new UnauthorizedException("Credenciais inválidas");
    }

    const payload: UserPayload = { email: user.email, sub: user.id };
    const jwtToken = this.jwtService.sign(payload, { expiresIn: '1d', secret: this.configService.get("JWT_SECRET") });
    return {
      access_token: jwtToken,
    };
  }

  async validateUser(email: string, senha: string) {
    const user = await this.userService.findByEmail(email);

    if (user) {
      const isPasswordValid = await bcrypt.compare(senha, user.senha_hash);
      if (isPasswordValid) {
        return {
          ...user,
          senha: undefined,
        };
      }
    }
    return null;
  }

  async redefinirSenha(email: string, novaSenha: string) {
    const usuario = await this.prisma.usuarios.findUnique({ where: { email } });
    if (!usuario) {
      throw new NotFoundException("Email não encontrado.");
    }
    const senhaHash = await bcrypt.hash(novaSenha, 10);
    return this.prisma.usuarios.update({
      where: { email },
      data: { senha_hash: senhaHash },
    });
  }
}