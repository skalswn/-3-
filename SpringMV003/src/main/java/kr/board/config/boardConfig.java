package kr.board.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
@Configuration
@ComponentScan(basePackages= {"kr.board.domain"})
public class boardConfig {

	@Bean(destroyMethod = "close")
	public DataSource dataSource(){
	HikariConfig hikariConfig = new HikariConfig();
	hikariConfig.setDriverClassName("com.mysql.jdbc.Driver");
	hikariConfig.setJdbcUrl("jdbc:mysql://localhost:3306/mysql");
	hikariConfig.setUsername("root");
	hikariConfig.setPassword("qwqw1212wewe");
	//hikariConfig.setMaximumPoolSize(5);
	//hikariConfig.setConnectionTestQuery("SELECT 1");
	//hikariConfig.setPoolName("springHikariCP");
	HikariDataSource dataSource = new HikariDataSource(hikariConfig);
	return dataSource;
	}
}
