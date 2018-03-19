package org.velvet.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.velvet.domain.AdminVO;
import org.velvet.domain.CategoryVO;
import org.velvet.domain.PageMaker;
import org.velvet.domain.ProductVO;
import org.velvet.domain.SearchCriteria;
import org.velvet.domain.UserVO;
import org.velvet.service.AProductService;
import org.velvet.util.MediaUtils;
import org.velvet.util.UploadFileUtils;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/*")
public class AProductController 
{
	private static final Logger logger = LoggerFactory.getLogger(AProductController.class);
	
	@Inject
	private AProductService service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 상품 목록 기능 (GET)
	@RequestMapping(value = "/productList", method = RequestMethod.GET)
	public void productList(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception 
	{
		logger.info(cri.toString());

	    model.addAttribute("productList", service.productlistSearch(cri));
	    List<ProductVO> list = service.productlistSearch(cri);
	    for(int i = 0; i < list.size(); i++)
	    logger.info(list.get(i).toString());
	    
	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    pageMaker.setTotalCount(service.productlistSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	}
	
	/*// 카테고리 리스트
	@RequestMapping("/categoryList")
	public String categoryList(Locale locale, Model model) throws Exception 
	{		
		List<CategoryVO> vo = null;
		vo = service.categoryList();
									// JSONArray.fromObject: vo 값들을 자바스크립트 객체로 변환
		model.addAttribute("jsonList", JSONArray.fromObject(vo));

		return "product/categoryList";
	}*/
	
	// 상품등록 기능 (GET)
	@RequestMapping(value = "/productAdd", method = RequestMethod.GET)
	public void productAddGET(Model model) throws Exception 
	{
		logger.info("productAdd get");
		// 카테고리 기능
		List<CategoryVO> vo = null;
		vo = service.categoryList();
		logger.info(vo.toString());
									// JSONArray.fromObject: vo 값들을 자바스크립트 객체로 변환
		model.addAttribute("jsonList", JSONArray.fromObject(vo));
		
		// p_no에 붙일 시퀀스 추가
		model.addAttribute("p_seq", service.productseq());
	}
	
	
	// 상품등록 기능 (POST)
	@RequestMapping(value = "/productAdd", method = RequestMethod.POST)
	public String productAddPOST(ProductVO product, Model model, MultipartFile file) throws Exception
	{
		logger.info("productAdd post");
		

		
		//logger.info(product.toString());	
		
		product.setP_photo(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()));
		logger.info(product.toString());
		
		
		/* 첨부파일 등록 기능 */
		// 파일의 원본이름 저장
		//String savedName = file.getOriginalFilename();
		// 파일의 정보 로그 출력
		/*logger.info("-----------------------------------------------------");
		logger.info("파일이름 : "+file.getOriginalFilename());
		logger.info("파일크기 : "+file.getSize());
		logger.info("컨텐트 타입 : "+file.getContentType());
		logger.info("-----------------------------------------------------");*/
		// 랜덤생성+파일이름 저장하기 위해  파일명 랜덤생성 메서드호출 
		//savedName = uploadFile(savedName, file.getBytes());
		
		service.productAdd(product);
	    // 완전히 새로운 작업을 이어가고 싶을 때는 redirect를 사용한다.
		return "redirect:/admin/productList/";
	}
	
	/****************************** # CK Editor 방식의 업로드 처리  *********************************/
	// 파일 업로드 부분 (CK EDITOR)
	// 이미지 업로드
	@RequestMapping("/imageUpload")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws Exception
	{
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		// 인코딩 utf-8
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try 
		{
			// CKEDITOR에서 업로드 된 파일의 이름을 참조
			String fileName = upload.getOriginalFilename();
			
			// CKEDITOR에서 업로드 된 파일을 byte배열로 참조
			byte[] bytes = upload.getBytes();
			HttpSession session = request.getSession();
			
			// 세션을 통해서 경로를 잡아주는 과정
			// 이 작업을 통해서 스프링에서 작업시 스프링에 지정된 경로에 파일이 업로드 되고
			// 서버에서 작업시 서버에서 지정된 경로에 파일이 업로드 되도록 한다
			String root_path = session.getServletContext().getRealPath("/");
			
			// 실제 업로드 될 톰캣서버의 물리적 경로 (나중에 서버에 올릴 땐 서버에 맞게 바꿔주어야 함)
			String uploadPath = root_path + "resources\\upload\\" + fileName;
			System.out.println("ck에디터 업로드 경로 : "+uploadPath);
			
			// 운영쪽에서 파일을 불러오기 위한 설정 작업 (request.getContextPath)
			//request.getContextPath("D:\\Rest_workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Css_Project\\resources\\upload\\" + fileName);
			
			// 출력스트림 객체 생성 (파일 생성)
			out = new FileOutputStream(new File(uploadPath));
			
			// 업로드 된 파일의 바이트 배열을 출력스트림에 사용. 
			out.write(bytes);
			
			// 파일복사 작업
			out.flush();
			
			String callback = request.getParameter("CKEditorFuncNum");
			
			printWriter = response.getWriter();
			
			// CKEDITOR에 업로드 된 서버측의 파일경로를 반환하는 목적
			// /resources/upload/ + fileName
			String fileUrl = "/upload/" + fileName;
			
			printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
			+ callback
			+ ",'"
			+ fileUrl
			+ "','이미지를 업로드 하였습니다.'"
			+ ")</script>");
			
			printWriter.flush();
			
		}catch(IOException e){
			e.printStackTrace();
		}finally{
			try 
			{
				if(out != null)
				{
					out.close();
				}
				
				if(printWriter != null)
				{
					printWriter.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		
		return;
	}

	
	// 파일명 랜덤생성 메서드 (컨트롤러 내부에서만 사용하기 때문에 private을 사용하고 @RequestMapping도 쓰지 않는다)
	private String uploadFile(String originalName, byte[] fileData) throws Exception
	{
		// UUID 발급
		UUID uuid = UUID.randomUUID();
		// 파일명 = UUID + 원본이름
		String savedName = uuid.toString() + "_" + originalName;
		// 파일 경로, 파일명을 받아 파일 객체 생성
		File target = new File(uploadPath, savedName);
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사
		// FileCopyUtils.copy(바이트배열, 파일객체)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	

    // 이미지 표시 매핑
    @ResponseBody // view가 아닌 data리턴
    @RequestMapping("/upload/displayFile")
    public ResponseEntity<byte[]> displayFile(String fileName) throws Exception 
    {
        // 서버의 파일을 다운로드하기 위한 스트림
        InputStream in = null; //java.io
        ResponseEntity<byte[]> entity = null;
        try {
            // 확장자를 추출하여 formatName에 저장
            String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
            // 추출한 확장자를 MediaUtils클래스에서  이미지파일여부를 검사하고 리턴받아 mType에 저장
            MediaType mType = MediaUtils.getMediaType(formatName);
            // 헤더 구성 객체(외부에서 데이터를 주고받을 때에는 header와 body를 구성해야하기 때문에)
            HttpHeaders headers = new HttpHeaders();
            // InputStream 생성
            in = new FileInputStream(uploadPath + fileName);
            // 이미지 파일이면
            if (mType != null) { 
                headers.setContentType(mType);
            // 이미지가 아니면
            } else { // 이미지 파일 외의 부분
                fileName = fileName.substring(fileName.indexOf("_") + 1);
                // 다운로드용 컨텐트 타입
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
                // 
                // 바이트배열을 스트링으로 : new String(fileName.getBytes("utf-8"),"iso-8859-1") * iso-8859-1 서유럽언어, 큰 따옴표 내부에  " \" 내용 \" "
                // 파일의 한글 깨짐 방지
                headers.add("Content-Disposition", "attachment; filename=\""+new String(fileName.getBytes("utf-8"), "iso-8859-1")+"\"");
                //headers.add("Content-Disposition", "attachment; filename='"+fileName+"'");
            }
            // 바이트배열, 헤더, HTTP상태코드
            entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            // HTTP상태 코드()
            entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
        } finally {
            in.close(); //스트림 닫기
        }
        return entity;
    }
    
    // 상품정보보기 (GET)
 	@RequestMapping(value = "/productInfo", method = RequestMethod.GET)
 	public void productInfo(@ModelAttribute("cri") SearchCriteria cri, String p_no, Model model) throws Exception 
 	{
 		logger.info("productInfo get");
 	    ProductVO vo2 = service.productInfo(p_no);
 	    model.addAttribute(vo2);
 	}
    
	// 상품 삭제 기능 (GET)
	@RequestMapping(value = "/productDel", method = RequestMethod.GET)
	public String productDel(@RequestParam("p_no") String p_no, @ModelAttribute("cri") SearchCriteria cri) throws Exception 
	{	
		logger.info(p_no);
	    service.productDel(p_no);
	    
	    logger.info(p_no + "상품 삭제 완료");
	    
	    return "redirect:/admin/productList?page=" + cri.getPage() 
	    		+ "&perPageNum=" + cri.getPerPageNum()
				+ "&searchType=" + cri.getSearchType()
				+ "&keyword=" + cri.getKeyword();	
	}
    
	// 상품 정보수정(GET)
	@RequestMapping(value = "/productModify", method = RequestMethod.GET)
	public void productModifyGET(@ModelAttribute("cri") SearchCriteria cri , String p_no, Model model, HttpServletRequest request) throws Exception 
	{
		model.addAttribute(service.productInfo(p_no));
	}

	// 상품 정보수정 (POST)
	@RequestMapping(value = "/productModify", method = RequestMethod.POST)
	public String productModifyPOST(ProductVO vo, @ModelAttribute("cri") SearchCriteria cri, HttpServletRequest request, MultipartFile file) throws Exception 
	{
		logger.info(vo.toString());
		
		if ((file.getOriginalFilename() == null) || (file.getOriginalFilename() == ""))
		{
			logger.info("첨부파일을 기존의 파일로 쓰는 경우 - 히든값에 저장된 원래 파일 출력");
		}
		else if (file != null)
		{
			logger.info("첨부파일을 수정하는 경우");
			vo.setP_photo(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()));   
		}	
		
		service.productModify(vo);
	    System.out.println("controller : " + vo.toString());
	    System.out.println("controller : " + cri.toString());
	    
		return "redirect:/admin/productInfo?page=" + cri.getPage() 
		+ "&perPageNum=" + cri.getPerPageNum()
		+ "&searchType=" + cri.getSearchType()
		+ "&keyword=" + cri.getKeyword()
		+ "&p_no=" + vo.getP_no();
	}
    
    
    
    
    
    
}

