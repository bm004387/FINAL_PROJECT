package com.springboot.tourvisit.member.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.springboot.tourvisit.member.vo.FileVO;

/**
 * File 테이블 Repository
 *
 */
public interface FileDAO extends JpaRepository<FileVO, Integer> {
	
	// FileIdx 값으로 조회
	FileVO findByFileIdx(int fileIdx);
	
	// Member Idx 값으로 조회
	FileVO findByMemberIdx(int memberIdx);
	
	// insert
	FileVO save(FileVO fileVO);
	
	// FileIdx 값으로 삭제
	void deleteByFileIdx(int fileIdx);
	
	// Member Idx 값으로 삭제
	void deleteByMemberIdx(int memberIdx);
	
}