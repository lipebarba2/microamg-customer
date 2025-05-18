package com.microservice.customer.dados;

import java.sql.Timestamp;


public record Assinante(
        String nome,
        String email,
        String documento,
        String descricao,
        String telefoneCelular,
        boolean notificarPorEmail,
        boolean notificarPorWhatsApp,
        boolean notificarPorSMS,
        String codigoIdentificador,
        Timestamp dtLimiteAssinatura
){

}

