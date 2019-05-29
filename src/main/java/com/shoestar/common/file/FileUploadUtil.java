package com.shoestar.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

// 05 - 21
@Log4j
public class FileUploadUtil {
	// Update는 기존 파일 삭제 후 다시 생성
	
	/* 파일 업로드할 폴더 생성 */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot); // 경로 받아오고 인스턴스 생성
		if(fileDir.exists()) { // 존재하면 
			return; // 종료
		}
		fileDir.mkdirs(); // mkdirs | + s : 그 앞의 파일 경로도 파일 생성한다. 
	}
	
	/* 파일 업로드 메서드 
	 * 파일명이 중복시 해결 방법
	 * System.currentTimeMillis()를 사용하거나 UUID는 128비트의 수이다.
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되며 총 36개 문자(32개 문자와 4개의 하이픈)로 
	 * 된 8-4-4-4-12라는 5개의 그룹을 하이픈으로 구분한다. 이를테면 다음과 같다. 
	 * 이때 UUID.randomUUID().toString()를 이용해서 얻는다.
	 * 50e8400-e29b-41d4-a716-446655440000
	 */
	
	/* 파일 업로드 메서드 */				// ★ 파일을 서버에 저장해주는
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload 호출 성공");
		
		String real_name = null;
		// MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename(); // 업로드되는 파일의 이름
		log.info("org_name : " + org_name);
		
		// 파일명 변경(중복되지 않기)
		if(org_name != null && (!org_name.equals(""))) {
						// 폴더명_현재 시간_사용자지정파일명
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name; // 저
			
			String docRoot = "C://uploadStorage//" + fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name); // 파일 생성후
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);// 지정위치에 실질적으로 저장시켜주는 메소드
		}
		return real_name;
	}
	
	/* 파일 삭제 메서드 */
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출 성공");
		boolean result = false;							
		String startDirName = "", docRoot = "";
												// 첫번째 위치의 _를 자른다.
		String dirName = fileName.substring(0, fileName.indexOf("_")); // 폴더명
		/*String docRoot = "C://uploadStorage//" + dirName;*/
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(
					dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//" + startDirName + "//" + dirName;
		} else {
			docRoot = "C://uploadStorage//" + dirName;
		}
		
		File fileDelete = new File(docRoot + "/" + fileName); // 파일 생성후
		log.info("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}
	
	
	/* 파일 Thumbnail 생성 메서드 */
	public static String makeThumbnail(String fileName) throws Exception{
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		// 이미지가 존재하는 폴더 추출
		String imgPath = "C://uploadStorage//" + dirName;
		// 추출된 폴더의 실제 경로(물리적 위치: C:\...)
		File fileAdd = new File(imgPath, fileName);
		log.info("원본 이미지 파일(fileAdd) : " + fileAdd);
		
		// ★
		BufferedImage sourceImg = ImageIO.read(fileAdd); 
		// 사이즈 변경
		BufferedImage destImg 
		= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,200);
		// 		resize(대상[BufferedImage 타입], 원본비율,			높이 또는 너비,			크기)
	
		String thumbnailName = "thumbnail_" + fileName; // 앞에 thumbnail_
		String docRoot = imgPath+"/thumbnail"; // C://uploadStorage//폴더명/thumbnail
		makeDir(docRoot);
		
		// 썸네일을 저장하기 위한 파일 객체
		File newFile = new File(docRoot, thumbnailName);
		log.info("업로드할 파일(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // 확장자까지 구해옴
		log.info("확장자(formatName) : " + formatName);
		
		// 출력
		ImageIO.write(destImg, formatName, newFile); // 사이즈, 확장자, 어느 위치에 저장
		return thumbnailName; // 현재 이름 return 
		
	}
}
