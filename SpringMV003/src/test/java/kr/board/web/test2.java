package kr.board.web;

import java.sql.Connection;

import javax.sql.DataSource;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class test2 {
	
	    @Autowired
	    private DataSource dataSource;
	    
	    @Test
	    public void testConnection() {
	        try(Connection con = dataSource.getConnection();){
	            System.out.println("con = " + con);
	          
	        } catch(Exception e) {
	            
	            e.printStackTrace();
	            
	        }
	        
	    }
	    
	}

