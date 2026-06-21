import { Body, Controller, Patch, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateAuthDto } from './dto/create-auth.dto';
import { Public } from './decorators/isPublic.decorator';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Public()
  @Post('login')
  login(@Body() dto: CreateAuthDto) {
    return this.authService.login(dto);
  }

  @Public()
  @Patch('redefinir-senha')
  redefinirSenha(@Body() dto: { email: string; novaSenha: string }) {
    return this.authService.redefinirSenha(dto.email, dto.novaSenha);
  }
}