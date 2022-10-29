package org.itsci.furniture_store.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
//    @Bean
//    public UserDetailsService userDetailsService() {
//        InMemoryUserDetailsManager manager = new InMemoryUserDetailsManager();
//        manager.createUser(User.withUsername("john")
//                .password("{noop}test123").roles("EMPLOYEE")
//                .build());
//        manager.createUser(User.withUsername("mary")
//                .password("{noop}test123").roles("EMPLOYEE", "MANAGER")
//                .build());
//        manager.createUser(User.withUsername("susan")
//                .password("{noop}test123").roles("EMPLOYEE", "ADMIN")
//                .build());
//        return manager;
//    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http)throws Exception {
        http.authorizeRequests(configurer -> {
            // configurer.anyRequest().authenticated();
            configurer.antMatchers("/product/**").hasRole("MANAGER")
                    .antMatchers("/shop/**").hasRole("ADMIN");
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
