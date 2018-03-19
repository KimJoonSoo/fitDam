package org.velvet.controller;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.velvet.dao.AProductDAO;
import org.velvet.domain.ProductVO;
import org.velvet.service.AProductService;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
	locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class testTset 
{
	private static final Logger logger = LoggerFactory.getLogger(testTset.class);
	
	@Inject
	private AProductDAO dao;
	
	@Test
	public void testregisterProduct() throws Exception
	{
		ProductVO vo = new ProductVO();
		
		vo.setCat_id("TOP");
		vo.setP_no("TOP_JC_50");
		vo.setP_name("상의테스트");
		vo.setP_price(50000);
		vo.setP_count(10);
		vo.setP_desc("설명설명");
		vo.setP_color("gray");
	    vo.setP_size("S/M/L");
	    vo.setP_photo("/images/bk.jpg");

	    logger.info(vo.toString());
	    dao.productAdd(vo);
	}
}
