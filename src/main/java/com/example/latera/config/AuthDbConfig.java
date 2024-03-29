package com.example.latera.config;

import javax.sql.DataSource;

import com.example.latera.repositories.web.UserRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;

import java.util.HashMap;
import java.util.Map;


@Configuration
@EnableJpaRepositories(
        basePackageClasses = UserRepository.class,
        entityManagerFactoryRef = "authEntityManager")
public class AuthDbConfig {

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource authDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    public LocalContainerEntityManagerFactoryBean authEntityManager(
            EntityManagerFactoryBuilder builder,
            @Qualifier("authDataSource") DataSource dataSource) {
        Map<String, Object> properties = new HashMap<>();
        properties.put("hibernate.dialect", "org.hibernate.dialect.MariaDBDialect");
        return builder
                .dataSource(dataSource)
                .packages("com.example.latera.models.web")
                .properties(properties)
                .build();
    }

}