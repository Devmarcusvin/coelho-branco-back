export class UserPayload {
    sub: number;        //id do user
    email: string;  
    iat?: number;       //quando o token foi criado
    exp?: number;       //quando o token vai expirar
}
