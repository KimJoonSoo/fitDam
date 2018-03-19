package org.velvet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.velvet.domain.MailVO;

import javax.mail.internet.MimeMessage; 
import org.springframework.mail.javamail.JavaMailSenderImpl; 
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.beans.factory.annotation.Autowired;



@Controller
public class MailController 
{

	//https://myaccount.google.com/lesssecureapps 보안인증
	
	// @Autowired는 @Inject 기능과 동일하다
	@Autowired private JavaMailSenderImpl mailSender;

	@RequestMapping(value = "/sendMail.do") 
	public String sendMail(final MailVO vo) 
	{ 
		vo.setFrom("useforjava@gmail.com");
		vo.setTo("useforjava@gmail.com");
		vo.setSubject("인증메일 발송 제목");
		vo.setContents("인증메일 발송 내용");
		
		final MimeMessagePreparator preparator = new MimeMessagePreparator() 
		{ 
			@Override 
			public void prepare(MimeMessage mimeMessage) throws Exception 
			{ 
				// 익명 구현 객체
				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8"); 
				helper.setFrom(vo.getFrom()); 
				helper.setTo(vo.getTo()); 
				helper.setSubject(vo.getSubject()); 
				helper.setText(vo.getContents(), true); 
			} 
		}; 
		mailSender.send(preparator); 
		return "result"; 
		}	
}
