package com.microservice.customer.dados;

import java.util.List;

public record AgregateClass(DadosProposta dto, List<Assinante> assinantes) {

}
