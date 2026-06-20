import { Controller, Post, Body, Get, UseGuards, HttpCode, HttpStatus } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateAuthDto } from './dto/create-auth.dto';
import {Public} from "./decorators/isPublic.decorator"

@Controller()
export class AuthController {
  constructor(private readonly authService: AuthService){}

  @Public()
  @HttpCode(HttpStatus.OK)
  @Post("login")
  login(@Body() LoginRequestBody: CreateAuthDto){
    return this.authService.login(LoginRequestBody);
  }
}
