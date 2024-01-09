package com.example.latera.config;

import javax.sql.DataSource;

import com.example.latera.repositories.game.CharacterRepository;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.boot.orm.jpa.EntityManagerFactoryBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;


@Configuration
@EnableJpaRepositories(
        basePackageClasses = CharacterRepository.class,
        entityManagerFactoryRef = "gameEntityManager")
public class GameDbConfig {

    @Bean
    @Primary
    @ConfigurationProperties(prefix = "spring.datasource-game")
    public DataSource GameDataSource() {
        return DataSourceBuilder.create().build();
    }

    @Bean
    @Primary
    public LocalContainerEntityManagerFactoryBean gameEntityManager(
            EntityManagerFactoryBuilder builder,
            @Qualifier("GameDataSource") DataSource dataSource) {
        return builder
                .dataSource(dataSource)
                .packages("com.example.latera.models.game")
                .build();
    }

}