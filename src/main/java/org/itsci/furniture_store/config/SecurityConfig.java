package org.itsci.furniture_store.config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http)throws Exception {
        http.authorizeRequests(configurer -> {
            // configurer.anyRequest().authenticated();
            configurer.antMatchers("/furniture/**").hasRole("MANAGER")
                    .antMatchers("/store/**").hasRole("ADMIN");
            //.antMatchers("/user/**").hasRole("ADMIN");
        });
        http.formLogin(configurer -> {
                    try {
                        configurer.loginPage("/login")
                                .loginProcessingUrl("/authenticate")
                                .permitAll()
                                .and()
                                .logout()
                                .permitAll();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
        );
        http.exceptionHandling(configurer -> {
            configurer.accessDeniedPage("/access-denied");
        });
        return http.build();
    }
}
